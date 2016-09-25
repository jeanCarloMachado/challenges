
class Converter
    attr_accessor :input_symbols
    MAP = {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000
    }

    def initialize (input_symbols = nil)
        @input_symbols = input_symbols
    end

    def convert
        assert_no_more_than_tree_times_in_succession
        assert_no_more_than_single_occurence
        assert_I_subtracs_only_valid_symbols
        assert_X_subtracs_only_valid_symbols

        result = 0
        i = 0
        @input_symbols.split("").each do |symbol|
            value = get_value(symbol)

            if precedes_greater_number?(value, i)
                result-=value
            else
                result+=value
            end

            i=i+1
        end
        result
    end

    def precedes_greater_number? (value, indice)
        next_value = @input_symbols.split("").at(indice+1)
        next_value = !next_value ? 0 : get_value(next_value)
        precedes_great_number = next_value > value

        if (precedes_great_number && consecutive_preceed_of_lesser_number(next_value, indice))
            raise "Only one small-value symbol may be subtracted from any large-value symbol"
        end

        precedes_great_number
    end

    def consecutive_preceed_of_lesser_number (next_value, indice)
        return nil if indice == 0

        previous_value = @input_symbols.split("").at(indice-1)
        return nil if !previous_value
        previous_value =  get_value(previous_value)
        previous_value < next_value
    end

    def get_value(symbol)
        MAP.each do |key, value|
            return value if key == symbol
        end
    end

    def assert_no_more_than_tree_times_in_succession
        raise "No more than 3 successions symbols" if /(IIII|XXXX|CCCC|MMMM)/ =~ @input_symbols
    end

    def assert_no_more_than_single_occurence
        raise "Symbols can never be repeated" if /(DD|LL|VV)/ =~ @input_symbols
    end

    def assert_I_subtracs_only_valid_symbols
        raise "I can be subtracted from V and X only" if /(IL|IC|ID|IM)/ =~ @input_symbols
    end

    def assert_X_subtracs_only_valid_symbols
        raise "X can be subtracted from L and C only" if /(XM|XD)/ =~ @input_symbols
    end

    def self.resolve(input_symbols)
        converter = self.new(input_symbols)
        converter.convert()
    end
end

