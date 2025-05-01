# string_calculator_test.rb
require 'minitest/autorun'
require_relative 'string_calculator'

#Test cases for string calculator
class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  # Empty string should return 0
  def test_add_empty_string
    assert_equal 0, @calculator.add('')
  end

  # Single number should return the number itself
  def test_add_single_number
    assert_equal 5, @calculator.add('5')
  end

  # Two numbers separated by a comma should return their sum
  def test_add_two_numbers
    assert_equal 6, @calculator.add('1,5')
  end

  # Input contains newline and comma as delimiters
  def test_add_with_newlines
    assert_equal 7, @calculator.add("1\n2,4")
  end

  # Input contains multiple newline characters with comma delimiters
  def test_add_with_complex_newline_delimiter
    assert_equal 16, @calculator.add("1\n\n\n\n\n3,3\n\n\n\n4,5")
  end

  # Custom delimiter ";" with a mixture of newline and semicolon separators
  def test_add_with_custom_delimiter
    assert_equal 12, @calculator.add("//;\n1;2;4;\n\n\n;0\n\n\n;5;0")
  end

  # Negative number should raise an exception
  def test_add_with_negative_number
    assert_raises(RuntimeError, "negative numbers not allowed -2") { @calculator.add("1,-2") }
  end

  # Multiple negative numbers should raise an exception with all negatives listed
  def test_add_with_multiple_negetive_number
    assert_raises(RuntimeError, "negative numbers not allowed -2, -5") {@calculator.add("1,-2,3,-5")}
  end

  # Numbers larger than 1000 should be ignored
  def test_add_ignores_numbers_bigger_than_1000
    assert_equal 7, @calculator.add('7,1001')
  end

  # Mix of valid numbers and large numbers with custom delimiter
  def test_add_with_custom_delimiter_and_bigger_number
    assert_equal 20, @calculator.add("//;\n1;2;3;4;\n\n\n;0\n\n\n;5;0;1009;9974;5")
  end

  # Custom delimiter with more than one character
  def test_add_with_delimiter_of_any_length
    assert_equal 6, @calculator.add("//[***]\n1***2***3")
  end

  # Multiple single-character delimiters
  def test_add_with_multiple_delimiters
    assert_equal 6, @calculator.add("//[*][%]\n1*2%3")
  end

  # Basic multiple delimiters
  def test_add_with_multiple_delimiters_basic
    assert_equal 6, @calculator.add("//[*][%]\n1*2%3")
  end

  # Multiple delimiters of different characters
  def test_add_with_multiple_different_delimiters
    assert_equal 10, @calculator.add("//[&][!]\n2&3!5")
  end

  # Delimiters with more than one character
  def test_add_with_long_delimiters
    assert_equal 10, @calculator.add("//[***][%%]\n2***3%%5")
  end

  # Delimiters with special symbols
  def test_add_with_special_symbol_delimiters
    assert_equal 6, @calculator.add("//[^^][$$]\n1^^2$$3")
  end

  # Delimiters containing numbers
  def test_add_with_delimiters_with_numbers
    assert_equal 6, @calculator.add("//[d1][e2]\n1d12e23")
  end

  # Three different delimiters
  def test_add_with_three_delimiters
    assert_equal 15, @calculator.add("//[+][!][@]\n5+5!2@3")
  end

  # Delimiters mixed with newlines
  def test_add_with_delimiters_and_newlines
    assert_equal 10, @calculator.add("//[*][%]\n1*2\n3%4")
  end

  # Delimiters of different lengths
  def test_add_with_varied_length_delimiters
    assert_equal 12, @calculator.add("//[***][#][@@]\n2***3#4@@3")
  end

  # Mixed valid and large numbers
  def test_add_with_large_number_ignored
    assert_equal 6, @calculator.add("//[*][%]\n1*2%1001%3")
  end
end