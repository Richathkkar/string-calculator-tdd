# string_calculator_test.rb
require 'minitest/autorun'
require_relative 'string_calculator'

#Test cases for string calculator
class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_add_empty_string
    assert_equal 0, @calculator.add('')
  end

  def test_add_single_number
    assert_equal 5, @calculator.add('5')
  end

  def test_add__two_numbers
    assert_equal 6, @calculator.add('1,5')
  end

  def test_add_with_newlines
    assert_equal 7, @calculator.add("1\n2,4")
  end

  def test_add_with_complex_newline_delimiter
    assert_equal 16, @calculator.add("1\n\n\n\n\n3,3\n\n\n\n4,5")
  end

  def test_add_with_custom_delimiter
    assert_equal 12, @calculator.add("//;\n1;2;4;\n\n\n;0\n\n\n;5;0")
  end
end