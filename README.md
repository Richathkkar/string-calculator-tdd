# string-calculator-tdd
A simple Ruby program that calculates string with some features:

Features

Handles strings of comma-separated numbers.
Returns the sum of the integers.
Supports new line delimiters.
Handles multiple numbers separated by both commas and newlines.
Supports custom delimiters.
Ignore bigger number(more than 1000)
Support any length of delimiter.

Getting Started
Follow these instructions to get the project running on your local machine.

Prerequisites

Ruby (version 3.0.0)

Check if Ruby is installed:

ruby --version

Installation

Clone the Repository using HTTP or SSH

HTTPS

git clone https://github.com/Richathkkar/string-calculator-tdd.git

SSH

git clone git@github.com:Richathkkar/string-calculator-tdd.git

# Usage

Run tests using:

ruby string_calculator_test.rb

Here are example usages of the add method and what they return:

1. Empty String
@calculator.add("")
# => 0

2. Single Number
@calculator.add("1")
# => 1

3. Two Numbers
@calculator.add("1,2")
# => 3

4. Multiple Numbers
@calculator.add("1,2,3,4")
# => 10

5. Newline as Delimiter
@calculator.add("1\n2,3")
# => 6

6. Custom Delimiter (Single Character)
@calculator.add("//;\n1;2")
# => 3

7. Ignore Numbers Greater Than 1000
@calculator.add("2,1001")
# => 2

8. Custom Delimiter of Any Length
@calculator.add("//[***]\n1***2***3")
# => 6

9. Multiple Custom Delimiters
@calculator.add("//[*][%]\n1*2%3")
# => 6

10. Negative Numbers Raise Exception
@calculator.add("-1,2,-3")
# => RuntimeError: "negative numbers not allowed -1, -3"

11. Test for multiple delimiters
@calculator.add("//[*][%]\n1*2%3")
# => 6

12. Test for delimiters with more than one character
@calculator.add("//[***][%%]\n2***3%%5")
# => 10

13. Test for delimiters with special symbols
@calculator.add("//[^^][$$]\n1^^2$$3")
# => 6

14. Test for delimiters containing numbers
@calculator.add("//[d1][e2]\n1d12e23")
# => 6

15. Test for three different delimiters
@calculator.add("//[+][!][@]\n5+5!2@3")
# => 15

16. Test for delimiters mixed with newlines
@calculator.add("//[*][%]\n1*2\n3%4")
# => 10

17. Test for delimiters of different lengths
@calculator.add("//[***][#][@@]\n2***3#4@@3")
# => 12

18. Test for mixed valid and large numbers
@calculator.add("//[*][%]\n1*2%1001%3")
# => 6