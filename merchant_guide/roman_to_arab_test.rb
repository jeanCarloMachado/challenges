
class RomanToArabTest < Test::Unit::TestCase
    def test_single_symbols
        assert_equal(1, RomanToArab.resolve('I'))
        assert_equal(5, RomanToArab.resolve('V'))
        assert_equal(10, RomanToArab.resolve('X'))
        assert_equal(50, RomanToArab.resolve('L'))
        assert_equal(100, RomanToArab.resolve('C'))
        assert_equal(500, RomanToArab.resolve('D'))
        assert_equal(1000, RomanToArab.resolve('M'))
    end

    def test_sums_when_greater_numbers_precedes_smaller_ones
        assert_equal(6, RomanToArab.resolve('VI'))
        assert_equal(7, RomanToArab.resolve('VII'))
        assert_equal(2006, RomanToArab.resolve('MMVI'))
    end

    def test_decrease_when_lesser_numbers_precedes_greater_ones
        assert_equal(40, RomanToArab.resolve('XL'))
        assert_equal(1944, RomanToArab.resolve('MCMXLIV'))
    end

    def test_only_tree_times_in_succession_symbols
        symbols = [ 'IIII', 'XXXX', 'CCCC', 'MMMM' ]
        symbols.each do |symbol|
            assert_raise_message("No more than 3 successions symbols") { RomanToArab.resolve(symbol) }
        end
    end

    def test_never_successive_symbols
        symbols = [ 'DD', 'LL', 'VV' ]
        symbols.each do |symbol|
            assert_raise_message("Symbols can never be repeated") { RomanToArab.resolve(symbol) }
        end
    end

    def test_I_can_be_subtracted_from_V_and_X_only

        invalid_symbols = [ 'IL', 'IC', 'ID', 'IM', 'MID', 'DIC' ]

        invalid_symbols.each do |symbol|
            assert_raise_message("I can be subtracted from V and X only") { RomanToArab.resolve(symbol) }
        end


        valid_symbols = [ 'IV', 'IX' ]
        valid_symbols.each { |symbol| assert_nothing_raised {RomanToArab.resolve(symbol)}}

    end


    def test_X_can_be_subtracted_from_L_and_C_only

        invalid_symbols = [ 'XD', 'XM', ]

        invalid_symbols.each do |symbol|
            assert_raise_message("X can be subtracted from L and C only") { RomanToArab.resolve(symbol) }
        end


        valid_symbols = [ 'XL', 'XC' ]
        valid_symbols.each { |symbol| assert_nothing_raised {RomanToArab.resolve(symbol)}}
    end


    def test_only_one_small_value_symbol_may_be_subtracted
        invalid_symbols = [ 'IIV', 'IVX', 'IIX', 'XXL']

        invalid_symbols.each do |symbol|
            assert_raise_message("Only one small-value symbol may be subtracted from any large-value symbol") { RomanToArab.resolve(symbol) }
        end


    end

    def test_only_one_small_value_symbol_may_be_subtracted_valid_cases
        valid_symbols = [ 'XLII' ]
        valid_symbols.each { |symbol| assert_nothing_raised {RomanToArab.resolve(symbol)}}
    end
end

