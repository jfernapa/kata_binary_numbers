require "minitest/autorun"

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

    def test_10111_plus_001010101_is_1101100
        assert_equal '1101100', @binary.sum('10111', '001010101')
    end

    def test_00_plus_0_is_0
        assert_equal '0', @binary.sum('00', '0')
    end
end

class BinaryNumbers

    attr_accessor :array_a, :array_b

public

    def initialize
        @array_a = Array.new
        @array_b = Array.new
        @array_result = Array.new
        @remainder = false
    end

    def sum(a, b)
        @array_a = string_binary_to_array(a)
        @array_b = string_binary_to_array(b)

        fill_array_with_nil

        for i in 0..array_a.size
            if @remainder
                if array_a[i] == nil or array_a[i] == '0'
                    array_a[i] = '1'
                    @remainder = false
                else
                    array_a[i] = '0'
                end
            end

            if array_a[i] == nil or array_b[i] == nil
                @array_result << array_a[i] if array_b[i].nil?
                @array_result << array_b[i] if array_a[i].nil?
            else
                if array_a[i] != array_b[i]
                     @array_result << '1'
                else
                    if array_a[i] == '0'
                        @array_result << '0'
                    else
                        @array_result << '0'
                        @remainder = true
                    end
                end
            end
        end

        @array_result << '1' if @remainder == true 

        return construct_string_result 
    end

    def construct_string_result
        @array_result.reverse!.compact!
        string_result = ""
        @array_result.each { |binary| string_result << binary }
        return string_result.to_i.to_s
    end

private

    def string_binary_to_array(binary_string)
        array = Array.new
        binary_string.each_char {|c| array << c }
        return array.reverse!
    end

    def fill_array_with_nil
        diff = @array_a.size - @array_b.size
        if diff > 0
            diff.times do
                @array_b << nil
            end
        else
            diff.abs.times do
                @array_a << nil
            end
        end
    end
end
