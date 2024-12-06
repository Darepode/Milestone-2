import os

def format_and_pad_hex(file_path):
    # Delete the first line of the input file
    with open(file_path, 'r') as file:
        lines = file.readlines()[1:]  # Skip the first line

    with open(file_path, 'w') as file:
        file.writelines(lines)

    # Split the file path into directory, base filename, and extension
    base, ext = os.path.splitext(file_path)
    
    # Construct the new filename with '_padded' before the extension
    output_path = f'{base}_padded{ext}'

    with open(file_path, 'r') as input_file:
        # Read the file and join all lines into one long string, then split into individual hex bytes
        data = input_file.read().replace('\n', ' ').strip()
        byte_sequence = data.split()

    # Format the byte sequence so each byte is on a new line
    formatted_lines = [byte + '\n' for byte in byte_sequence]

    # Calculate how many lines we need to pad to reach 8192
    current_lines = len(formatted_lines)
    if current_lines < 8192:
        padding_needed = 8192 - current_lines
        # Add '00\n' padded lines to the file until it has 8192 lines
        formatted_lines.extend(['00\n'] * padding_needed)

    # Write the formatted and padded content to the output file
    with open(output_path, 'w') as output_file:
        output_file.writelines(formatted_lines)

    print(f'Formatted and padded file saved as: {output_path}')

# Example usage:
file_path = '../test_in.hex'  # replace with your actual file path
format_and_pad_hex(file_path)
