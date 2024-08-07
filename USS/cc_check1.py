#Import the Z Open Automation Utilities libraries we need
from zoautil_py import MVSCmd, Datasets
from zoautil_py.types import DDStatement
# Import datetime, needed so we can format the report
from datetime import datetime
# Import os, needed to get the environment variables
import os

#Take the contents of this data set and read it into cc_contents
cc_contents = Datasets.read("Z80843.DATA.CCINVLD")

USERID = os.getenv('USER')
output_dataset=USERID+".OUTPUT.CCINVLD"
#Delete the output dataset if it already exists
if Datasets.exists(output_dataset):
    Datasets.delete(output_dataset)
# Use this line to create a new SEQUENTIAL DATA SET with the name of output_dataset
# (hint: https://www.ibm.com/support/knowledgecenter/SSKFYE_1.0.1/python_doc_zoautil/api/datasets.html?view=embed)


#A function that checks to see if the number passed to it is even. Returns True or False (Boolean)
def is_even(num_to_check):              # this is a function. num_to_check is what gets sent to it
    if ((num_to_check % 2) == 0):       # a simple check to see if num_to_check is even.
        result = True                   # We set result to True
        return result                   # and then return it.
    else:                               # if it isn't
        result = False                  # set return to False
        return result                   # and return that.

cc_list = cc_contents.splitlines()      # take that giant string and turn it into a List
invalid_cc_list = []                    # A second list to hold invalid entries
for cc_line in cc_list:                 # do everything here for every item in that List
    cc_digits = int(cc_line[8:16])      # Just grabbing some digits. Not a full CC number (HINT!)
    if (is_even(cc_digits)):            # If the card number is valid
        invalid_cc_list.append(cc_line)


#The Report-Writing Part
    #
    # NOTE: DON'T USE APPEND FOR MULTIPLE LINES. 
    #       IT WILL BE SLOW
    #       INSTEAD, THROW EVERYTHING INTO A VARIABLE
    #       AND WRITE THAT OUT ONCE, LIKE THIS.
    #       
    #       TRUST US ON THIS.
    #
    #       YOU SHOULD BE ABLE TO USE THE CODE BELOW, ONLY HAVING TO ADD
    #       A LINE TO WRITE OUT THE FINAL report_output TO YOUR output_dataset
    #       REMEMBER, THE REPORT NEEDS TO HAVE THE DATETIME STRING IN IT ABOVE THE DATA
    #
now = datetime.now()
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
report_output = '\n'.join(invalid_cc_list)
report_output = "INVALID CREDIT CARD REPORT FOR " + dt_string + '\n\n' + report_output
print(report_output)  # Print it out to the screen. 
# When you're ready to write your report out to file, uncomment that last line
# Datasets.write(output_dataset,report_output)