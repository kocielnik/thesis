#!/usr/bin/env python3

import unittest
import PyPDF2
import argparse
import os
import io
import readline

script_path = os.path.dirname(os.path.realpath(__file__))

def file_name():

    parser = argparse.ArgumentParser(description='Give file name.')
    parser.add_argument('file_name', metavar='S', type=string, nargs='+',
                    help='file name')

    args = parser.parse_args()

def count_pages():

    filename = "out.pdf"

    file_object = open(filename, 'rb')

    pdf = PyPDF2.PdfFileReader(file_object)

    return pdf.getNumPages()

pages = count_pages()

# Set error flag value.
goal = -1

goal_file_path = os.path.join(script_path, 'goal')

with open(goal_file_path, 'r') as f:
    goal_str = f.readline(10)
    f.close()  # Avoid leaking the file descriptor.

goal = int(goal_str)

success_msg = "Success! You have " + str(pages) + " pages out of the "
success_msg = success_msg + str(goal) + " that you wanted today!"

print("Your daily goal for today was:", goal, "pages.")

if pages > goal:
    print(success_msg)
else:
    print("You now have", pages, "pages. Way to go!")

