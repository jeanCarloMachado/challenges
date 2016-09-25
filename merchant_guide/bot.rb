require "test/unit"
load "roman_converter.rb"

class Bot
  TRANSLATIONS = {
  }

  def self.Factory()
    bot = self.new(Converter.new())
  end

  def initialize(roman_converter)
    @roman_converter = roman_converter
  end

  def instruct(message)
    match = message.match(/([A-Za-z]*) is ([A-Za-z]*)/)
    TRANSLATIONS[match[1]] = match[2]
  end

  def questionate(question)
    match = question.match(/how much is ([A-Za-z ]*) ?/)

    symbol_alias = match[1]
    symbol_alias.strip!
    roman_vesion = convert_to_roman_str (symbol_alias)

    @roman_converter.symbols = roman_vesion
    value = @roman_converter.convert

    "#{symbol_alias} is #{value}"
  end

  def convert_to_roman_str (str)
    result = ""
    str.split(" ").each do |part|
      result << TRANSLATIONS[part]
    end
    result
  end
end

class BotTest < Test::Unit::TestCase

  def test_replacement_instructions
    bot = Bot.Factory()
    bot.instruct('glob is I')
    bot.instruct('prok is V')
    bot.instruct('pish is X')
    bot.instruct('tegj is L')

    assert_equal("glob is 1", bot.questionate('how much is glob ?'))
    assert_equal("prok is 5", bot.questionate('how much is prok ?'))
    assert_equal("pish is 10", bot.questionate('how much is pish ?'))
    assert_equal("tegj is 50", bot.questionate('how much is tegj ?'))


    assert_equal("pish tegj glob glob is 42", bot.questionate('how much is pish tegj glob glob ?'))

  end

  def test_abstract_values
    bot = Bot.Factory()
    bot.instruct('glob is I')
    bot.instruct('prok is V')
    bot.instruct('pish is X')
    bot.instruct('glob glob Silver is 34 Credits')

    assert_equal(
      "glob prok Silver is 68 Credits",
      bot.questionate('how many Credits is glob prok Silver ?')
    )
  end
end
