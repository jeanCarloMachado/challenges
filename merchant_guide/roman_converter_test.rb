
class ConverterTest < Test::Unit::TestCase
    def test_single_symbols
        assert_equal(1, Converter.resolve('I'))
        assert_equal(5, Converter.resolve('V'))
        assert_equal(10, Converter.resolve('X'))
        assert_equal(50, Converter.resolve('L'))
        assert_equal(100, Converter.resolve('C'))
        assert_equal(500, Converter.resolve('D'))
        assert_equal(1000, Converter.resolve('M'))
    end

    def test_sums_when_greater_numbers_precedes_smaller_ones
        assert_equal(6, Converter.resolve('VI'))
        assert_equal(7, Converter.resolve('VII'))
        assert_equal(2006, Converter.resolve('MMVI'))
    end

    def test_decrease_when_lesser_numbers_precedes_greater_ones
        assert_equal(40, Converter.resolve('XL'))
        assert_equal(1944, Converter.resolve('MCMXLIV'))
    end

    def test_only_tree_times_in_succession_symbols
        symbols = [ 'IIII', 'XXXX', 'CCCC', 'MMMM' ]
        symbols.each do |symbol|
            assert_raise_message("No more than 3 successions symbols") { Converter.resolve(symbol) }
        end
    end

    def test_never_successive_symbols
        symbols = [ 'DD', 'LL', 'VV' ]
        symbols.each do |symbol|
            assert_raise_message("Symbols can never be repeated") { Converter.resolve(symbol) }
        end
    end

    def test_I_can_be_subtracted_from_V_and_X_only

        invalid_symbols = [ 'IL', 'IC', 'ID', 'IM', 'MID', 'DIC' ]

        invalid_symbols.each do |symbol|
            assert_raise_message("I can be subtracted from V and X only") { Converter.resolve(symbol) }
        end


        valid_symbols = [ 'IV', 'IX' ]
        valid_symbols.each { |symbol| assert_nothing_raised {Converter.resolve(symbol)}}

    end


    def test_X_can_be_subtracted_from_L_and_C_only

        invalid_symbols = [ 'XD', 'XM', ]

        invalid_symbols.each do |symbol|
            assert_raise_message("X can be subtracted from L and C only") { Converter.resolve(symbol) }
        end


        valid_symbols = [ 'XL', 'XC' ]
        valid_symbols.each { |symbol| assert_nothing_raised {Converter.resolve(symbol)}}
    end


    def test_only_one_small_value_symbol_may_be_subtracted
        invalid_symbols = [ 'IIV', 'IVX', 'IIX', 'XXL']

        invalid_symbols.each do |symbol|
            assert_raise_message("Only one small-value symbol may be subtracted from any large-value symbol") { Converter.resolve(symbol) }
        end


    end

    def test_only_one_small_value_symbol_may_be_subtracted_valid_cases
        valid_symbols = [ 'XLII' ]
        valid_symbols.each { |symbol| assert_nothing_raised {Converter.resolve(symbol)}}
    end
end

