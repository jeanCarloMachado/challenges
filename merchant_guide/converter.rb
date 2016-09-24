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
    assert_no_more_than_single_occurence

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

  def assert_no_more_than_single_occurence
    raise "Symbols can never be repeated" if /(DD|LL|VV)/ =~ @symbols
  end

  def self.resolve(symbols)
    converter = self.new(symbols)
    converter.getResult()
  end

end

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
end

