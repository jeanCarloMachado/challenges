require "test/unit"

class Converter
  MAP = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  def initialize(symbols)
    @symbols = symbols
  end

  def getResult

    assert_no_more_than_tree_times_in_succession

    result = 0
    i = 0
    @symbols.split("").each do |symbol|
      value = getValue(symbol)
      precedes_greater_number?(value, i) ?  result-=value : result+=value
      i=i+1
    end
    result
  end

  def precedes_greater_number? (value, i)
      nextValue = @symbols.split("").at(i+1)
      nextValue = !nextValue ? 0 : getValue(nextValue)
      nextValue > value
  end

  def getValue(symbol)
      MAP.each do |key, value|
        return value if key == symbol
      end
  end

  def assert_no_more_than_tree_times_in_succession
    raise "No more than 3 successions symbols" if /(IIII|XXXX|CCCC|MMMM)/ =~ @symbols
  end

end

class ConverterTest < Test::Unit::TestCase
  def test_single_symbols
    assert_equal(1, Converter.new('I').getResult())
    assert_equal(5, Converter.new('V').getResult())
    assert_equal(10, Converter.new('X').getResult())
    assert_equal(50, Converter.new('L').getResult())
    assert_equal(100, Converter.new('C').getResult())
    assert_equal(500, Converter.new('D').getResult())
    assert_equal(1000, Converter.new('M').getResult())
  end

  def test_sums_when_greater_numbers_precedes_smaller_ones
    assert_equal(6, Converter.new('VI').getResult())
    assert_equal(7, Converter.new('VII').getResult())
    assert_equal(2006, Converter.new('MMVI').getResult())
  end

  def test_decrease_when_lesser_numbers_precedes_greater_ones
    assert_equal(40, Converter.new('XL').getResult())
    assert_equal(1944, Converter.new('MCMXLIV').getResult())
  end

  def test_only_tree_times_in_succession
    symbols = [ 'IIII', 'XXXX', 'CCCC', 'MMMM' ]
    symbols.each do |symbol|
      assert_raise_message("No more than 3 successions symbols") { Converter.new(symbol).getResult() }
    end
  end
end

