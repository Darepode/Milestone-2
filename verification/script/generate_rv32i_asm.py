import random
import sys

# RV32I Instruction set
rv32i_instructions = [
    'ADD', 'SUB', 'AND', 'OR', 'XOR', 'SLL', 'SRL', 'SRA',  # Register-register operations
    'ADDI', 'ANDI', 'ORI', 'XORI', 'SLLI', 'SRLI', 'SRAI',  # Immediate operations
    'LUI', 'AUIPC',                                         # Upper immediate
    'BEQ', 'BNE', 'BLT', 'BGE', 'BLTU', 'BGEU',             # Conditional branches
    'JAL', 'JALR',                                          # Jumps
    'LB', 'LH', 'LW', 'LBU', 'LHU',                         # Load
    'SB', 'SH', 'SW',                                       # Store
]

# Registers in RV32I (x0 - x31)
registers = [f'x{i}' for i in range(32)]

# Memory labels for data access (for load/store instructions)
memory_labels = ['data1', 'data2', 'data3', 'data4']

# Label list for branches
labels = ['here1', 'here2', 'here3', 'here4']

def generate_r_type():
    """Generate a random R-type instruction (ADD, SUB, etc.)"""
    instruction = random.choice(['ADD', 'SUB', 'AND', 'OR', 'XOR', 'SLL', 'SRL', 'SRA'])
    rd = random.choice(registers)
    rs1 = random.choice(registers)
    rs2 = random.choice(registers)
    return f"{instruction} {rd}, {rs1}, {rs2}"

def generate_i_type():
    """Generate a random I-type instruction (ADDI, ANDI, etc.)"""
    instruction = random.choice(['ADDI', 'ANDI', 'ORI', 'XORI'])
    rd = random.choice(registers)
    rs1 = random.choice(registers)
    imm = random.randint(-2048, 2047)  # 12-bit signed immediate
    return f"{instruction} {rd}, {rs1}, {imm}"

def generate_shift():
    """Generate a random Shift instruction ('SLLI', 'SRLI', 'SRAI')"""
    instruction = random.choice(['SLLI', 'SRLI', 'SRAI'])
    rd = random.choice(registers)
    rs1 = random.choice(registers)
    imm = random.randint(0, 31)  # 5-bit immediate
    return f"{instruction} {rd}, {rs1}, {imm}"

def generate_s_type():
    """Generate a random S-type instruction (SW, LW)"""
    instruction = random.choice(['SW', 'LW'])
    rs1 = random.choice([reg for reg in registers if reg != 'x0'])
    rs2 = random.choice(registers)
    data = random.choice(memory_labels)
    imm = random.randint(0, 0)  # 12-bit signed immediate
    return f"LA {rs1}, {data}\n{instruction} {rs2}, {imm}({rs1})"

def generate_b_type(valid_labels):
    """Generate a random B-type instruction (BEQ, BNE, etc.) and ensure it uses valid labels."""
    if not valid_labels:
        return generate_r_type()  # If there are no valid labels, fall back to a different instruction

    instruction = random.choice(['BEQ', 'BNE', 'BLT', 'BGE', 'BLTU', 'BGEU'])
    rs1 = random.choice(registers)
    rs2 = random.choice(registers)
    target_label = random.choice(valid_labels)
    return f"{instruction} {rs1}, {rs2}, {target_label}"

def generate_u_type():
    """Generate a random U-type instruction (LUI, AUIPC)"""
    instruction = random.choice(['LUI']) # 'AUIPC'
    rd = random.choice([reg for reg in registers if reg != 'x0'])
    imm = random.randint(0, 1048575)  # 20-bit immediate
    return f"{instruction} {rd}, {imm}"

def insert_labels(asm_lines, num_labels=4):
    """Insert labels like here1, here2, etc. evenly throughout the code."""
    num_instructions = len(asm_lines)
    label_interval = num_instructions // (num_labels + 1)
    
    label_positions = [(i+1) * label_interval for i in range(num_labels)]
    
    for i, pos in enumerate(label_positions):
        asm_lines.insert(pos, f'{labels[i]}:')
    
    return asm_lines

def generate_asm_instruction(valid_labels):
    """Randomly generate an instruction from RV32I, with valid labels for branches."""
    instruction_type = random.choice(['R', 'I', 'B', 'U', 'SHIFT'])
    
    if instruction_type == 'R':
        return generate_r_type()
    elif instruction_type == 'I':
        return generate_i_type()
    # elif instruction_type == 'S':
    #     return generate_s_type()
    elif instruction_type == 'B':
        return generate_b_type(valid_labels)
    elif instruction_type == 'U':
        return generate_u_type()
    elif instruction_type == 'SHIFT':
        return generate_shift()

def update_labels_after(asm_code, label, next_label):
    """
    Change all occurrences of `label` after it has been inserted to `next_label`.
    """
    updated_code = []
    found_label = False
    
    for line in asm_code:
        if f"{label}:" in line:  # Detect when the label is inserted
            found_label = True
        
        if found_label:
            # Replace occurrences of the label in lines that are not label declarations
            if not line.strip().endswith(':'):
                line = line.replace(label, next_label)
        
        updated_code.append(line)
    
    return updated_code

def replace_here4_with_here(asm_code):
    """
    After the line 'here4:', replace all occurrences of 'here4' with 'here',
    except for the 'here4:' label itself.
    """
    updated_code = []
    found_here4_label = False
    
    for line in asm_code:
        if "here4:" in line:  # Detect the 'here4:' label
            found_here4_label = True
            updated_code.append(line)  # Don't change the label itself
            continue
        
        if found_here4_label:
            # Replace 'here4' with 'here' after 'here4:' has been found
            line = line.replace('here4', 'here')
        
        updated_code.append(line)
    
    return updated_code

def generate_rv32i_asm(num_instructions=20):
    """Generate a list of RV32I assembly instructions with labels inserted."""
    asm_code = []
    
    # Optional: Define some labels for data
    # asm_code.append('.section .data')
    # for label in memory_labels:
    #     asm_code.append(f'{label}: .word {random.randint(0, 100)}')

    # Code section
    # asm_code.append('.section .text')
    # asm_code.append('.globl _start')
    # asm_code.append('_start:')
    
    instructions = []
    valid_labels_for_each_section = [
        [],                   # Before label insertion
        ['here1'],             # After here1 is inserted
        ['here1', 'here2'],    # After here2 is inserted
        ['here1', 'here2', 'here3'], # After here3 is inserted
        ['here1', 'here2', 'here3', 'here4'],  # After all labels are inserted
    ]

    label_intervals = num_instructions // 5
    for i in range(num_instructions - 1):
        # Determine which section we're in and what valid labels can be used for branches
        section = i // label_intervals
        valid_labels = labels[section:]  # Only allow branch instructions to jump forward, not back
        instructions.append(generate_asm_instruction(valid_labels))

    # Insert labels at regular intervals
    instructions = insert_labels(instructions)

    # After inserting each label, ensure subsequent uses of it are changed to the next label
    for i in range(len(labels) - 1):
        instructions = update_labels_after(instructions, labels[i], labels[i + 1])

    # Replace 'here4' with 'here' after 'here4:' has been inserted
    instructions = replace_here4_with_here(instructions)

    # Add ECALL for program exit
    instructions.append('here:')
    instructions.append('ADDI x0, x0, 0')
    
    asm_code.extend(instructions)
    asm_code.append('\n')

    return '\n'.join(asm_code)

if __name__ == '__main__':
    # Check if a number of instructions has been passed from the command line
    if len(sys.argv) != 2:
        print("Usage: python generate_rv32i_asm.py <number_of_instructions>")
        sys.exit(1)

    try:
        num_instructions = int(sys.argv[1])
    except ValueError:
        print("Error: The number of instructions must be an integer.")
        sys.exit(1)

    # Ensure the number of instructions is valid
    if num_instructions <= 0:
        print("Error: The number of instructions must be greater than 0.")
        sys.exit(1)

    # Generate RV32I assembly code with the specified number of instructions
    asm_code = generate_rv32i_asm(num_instructions)
    
    # Write the generated assembly code to a file
    with open('riscv_asm_test.s', 'w') as f:
        f.write(asm_code)
    
    print(f"Assembly code with {num_instructions} instructions has been written to 'riscv_asm_test.s'.")
