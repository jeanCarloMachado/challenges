load "roman_converter.rb"

class Bot
  TRANSLATIONS = {}
  LABELS = {}

  def self.Factory()
    bot = self.new(Converter.new())
  end

  def initialize(roman_converter)
    @roman_converter = roman_converter
  end

  def instruct(message)
    if /Credits$/ =~ message
      match = message.match(/([A-Za-z ]*) ([A-Za-z]+) is ([0-9]*)/)
      units = match[1]
      label = match[2]
      credits = match[3].to_i

      units = get_value_from_symbols(units)
      single_value = credits / units

      LABELS[label] = single_value
      return

    end

    match = message.match(/([A-Za-z]*) is ([A-Za-z]*)/)
    TRANSLATIONS[match[1]] = match[2]
  end

  def questionate(question)

    case
      when how_many_question(question)
        match = question.match(/is ([A-Za-z ]*) ([A-Za-z]+) ?/)
        symbols = match[1]
        label = match[2]

        units = get_value_from_symbols(symbols)
        credits = LABELS[label] * units

        return "#{symbols} #{label} is #{credits} Credits"
      when how_much_question(question)
        match = question.match(/how much is ([A-Za-z ]*) ?/)

        symbol_alias = match[1]
        symbol_alias.strip!
        value = get_value_from_symbols(symbol_alias)
        return "#{symbol_alias} is #{value}"
    end

  end

  def how_many_question (question)
      /^how many Credits/ =~ question
  end

  def how_much_question (question)
      /^how much is/ =~ question
  end


  def get_value_from_symbols(symbol_alias)
    roman_vesion = convert_to_roman_str (symbol_alias)
    @roman_converter.symbols = roman_vesion
    @roman_converter.convert
  end

  def convert_to_roman_str (str)
    result = ""
    str.split(" ").each do |part|
      result << TRANSLATIONS[part]
    end
    result
  end
end

