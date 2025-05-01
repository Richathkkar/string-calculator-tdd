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
end