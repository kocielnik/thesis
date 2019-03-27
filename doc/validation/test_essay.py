#!/usr/bin/env python3

import unittest
import PyPDF2
import argparse
import os
import io
import readline

script_path = os.path.dirname(os.path.realpath(__file__))

parser = argparse.ArgumentParser(description='Give file name.')
parser.add_argument('file', help='File to be tested')
args = parser.parse_args()

def file_name(args):

    f = args.file

    return f

def count_pages():

    filename = file_name(args)
    #filename = "out.pdf"

    file_path = os.path.join(script_path, filename)

    #print(file_path)

    file_object = open(file_path, 'rb')

    pdf = PyPDF2.PdfFileReader(file_object)

    return pdf.getNumPages()

# def spell_check():
#    "aspell -c source.md -d pl"

pages = count_pages()

# Set error flag value.
goal = -1

goal_file_path = os.path.join(script_path, 'goal')

try:
    f = open(goal_file_path, 'r')
    goal_str = f.readline(10)
except:
    print("File could not be found.")
finally:
    f.close()  # Avoid leaking the file descriptor.

goal = int(goal_str)

success_msg = "Success! You have " + str(pages) + " pages out of the "
success_msg = success_msg + str(goal) + " that you wanted today!"

print("Your daily goal for today was:", goal, "pages.")

if pages >= goal:
    print(success_msg)
else:
    print("You now have", pages, "pages. Way to go!")

