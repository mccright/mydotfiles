#!/usr/bin/python3

import sys
import statistics
import re

def get_median(list_items: list) -> float:
    median_number = statistics.median(list_items)
    return median_number

def get_mean(list_items: list) -> float:
    mean_number = statistics.mean(list_items)
    return mean_number

# Don't need to do the sorting.
# The statistics module does it for you.
# median_number = statistics.median(sorted(list_items))
# mean_number = statistics.mean(sorted(list_items))

def remove_commas(string_input: str) -> str:
    # Input: A collection of "strings" that may be comma separated.
    # Output: A collection of "strings" that are now space separated.
    no_commas = re.sub(r",", " ", string_input)
    return no_commas

def convert_strings_to_floats(strings: str) -> list:
    # Input: The "strings" must be a list of "numbers" in string format, 
    # Output: A Python `list` of floats composed of the numbers in the Input.
    # 
    # Remove commas - because it receives lists...
    strings_no_commas: str = remove_commas(strings)
    # Convert string input to a list of floats.
    # list you would receive on the command line.
    # This approach was outlined at:
    # https://www.geeksforgeeks.org/python/python-converting-all-strings-in-list-to-integers/
    list_integers: list = list(map(float, strings_no_commas.split()))
    return list_integers


def main(num_args: int, usage: str):
    if len(sys.argv) != num_args:
        this_script = sys.argv[0]
        usage_message = usage.replace("script_name", str(this_script))
        print(usage_message)
        sys.exit(1)
    else:
        input_list_strings: list = sys.argv[1]
        # Convert the string input to a list of floats.
        # https://www.geeksforgeeks.org/python/python-converting-all-strings-in-list-to-integers/
        input_list_integers = convert_strings_to_floats(input_list_strings)
        # input_list_integers = list(map(float, input_list_strings.split()))
        print(f"median: {get_median(input_list_integers):.3f}")
        print(f"mean:   {get_mean(input_list_integers):.3f}")

if __name__ == '__main__':
    inputs_4_usage_msg = '<list of numbers in quotes>'
    usage_msg = f"USAGE: python3 script_name {inputs_4_usage_msg}"
    main(2, usage_msg)

