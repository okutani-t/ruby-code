require 'minitest/autorun'
require_relative '../lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal '7', fizz_buzz(7)
    assert_equal '8', fizz_buzz(8)
    assert_equal 'Fizz', fizz_buzz(9)
    assert_equal 'Buzz', fizz_buzz(10)
    assert_equal '11', fizz_buzz(11)
    assert_equal 'Fizz Buzz', fizz_buzz(15)
    assert_equal '29', fizz_buzz(29)
    assert_equal 'Fizz Buzz', fizz_buzz(30)
    assert_equal '31', fizz_buzz(31)
    assert_equal '数値を入力してください', fizz_buzz('hoge')
    assert_equal '数値を入力してください', fizz_buzz([1])
  end
end
