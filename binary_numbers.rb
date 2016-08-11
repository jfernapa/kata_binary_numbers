class BinaryNumbers

    attr_accessor :array_a, :array_b

public

    def initialize
        @array_result = Array.new
        @remainder = false
    end

    def sum(a, b)
        @array_a = string_binary_to_array(a)
        @array_b = string_binary_to_array(b)
        fill_array_with_nil

        for i in 0..array_a.size 

            use_remainder_if_there(i)

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

private

    def construct_string_result
        @array_result.reverse!.compact!
        string_result = ""
        @array_result.each { |binary| string_result << binary }
        return string_result.to_i.to_s
    end

    def use_remainder_if_there(i)
        if @remainder
            if @array_a[i] == nil or @array_a[i] == '0'
                @array_a[i] = '1'
                @remainder = false
            else
                @array_a[i] = '0'
            end
        end
    end

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
