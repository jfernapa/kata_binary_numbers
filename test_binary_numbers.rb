require "minitest/autorun"
require_relative "binary_numbers.rb"

class TestBinaryNumbers < Minitest::Test

    def setup
        @binary = BinaryNumbers.new
    end

    def test_one_plus_zero_is_one
        assert_equal '1', @binary.sum('1', '0')
    end

    def test_zero_plus_one_is_one
        assert_equal '1', @binary.sum('0', '1')
    end

    def test_zero_plus_zero_is_zero
        assert_equal '0', @binary.sum('0', '0')
    end

    def test_one_plus_one_is_10
        assert_equal '10', @binary.sum('1', '1')
    end

    def test_10_plus_10_is_100
        assert_equal '100', @binary.sum('10', '10')
    end

    def test_10_plus_1_is_011
        assert_equal '11', @binary.sum('10', '1')
    end

    def test_111_plus_10_is_1001
        assert_equal '1001', @binary.sum('111', '10')
    end

    def test_100_plus_110_is_1001
        assert_equal '1010', @binary.sum('100', '110')
    end

    def test_1101_plus_101_is_10010
        assert_equal '10010', @binary.sum('1101', '101')
    end

    def test_1101_plus_10111_is_100100
        assert_equal '100100', @binary.sum('1101', '10111')
    end

    def test_1001_plus_11_is_1100
        assert_equal '1100', @binary.sum('1001', '11')
    end
end
