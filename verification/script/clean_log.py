# Python script to delete lines containing "exception" from a file

def clean_log_file(input_file, output_file):
    try:
        # Open the input file for reading
        with open(input_file, 'r') as infile:
            lines = infile.readlines()

        # Open the output file for writing (this will overwrite the file)
        with open(output_file, 'w') as outfile:
            for line in lines:
                # Check if the line contains the word "exception"
                if "exception" not in line and "tval" not in line and "0x0000006f" not in line :
                    outfile.write(line)

        print(f"Cleaned log file has been written to {output_file}")

    except FileNotFoundError:
        print(f"Error: The file {input_file} was not found.")


# Usage
input_file = "logs/spike_ori.log"  # Replace with the actual input log file name
output_file = "logs/spike_ori_clean.log"  # Replace with the desired output file name
clean_log_file(input_file, output_file)
