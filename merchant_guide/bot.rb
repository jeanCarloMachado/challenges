require "./roman_converter"

class Bot
    ALIASES = {}
    ITENS_CREDITS = {}

    def self.Factory
        bot = self.new(Converter.new())
    end

    def initialize (roman_converter)
        @roman_converter = roman_converter
    end

    def talk (message)
        begin
            if isQuestion(message)
                return questionate(message)
            end

            instruct(message)
        rescue
            return "I have no idea what you are talking about"
        end
    end

    def isQuestion (str)
        /\?$/ =~ str
    end

    def instruct (message)
        case
        when instruct_value_in_credits(message)
            match = message.match(/([A-Za-z ]*) ([A-Za-z]+) is ([0-9]*)/)
            symbols_aliases = match[1]
            item = match[2]
            credits = match[3].to_i

            units = get_value_from_symbols_aliases(symbols_aliases)
            credits_per_unit = credits / units

            ITENS_CREDITS[item] = credits_per_unit
            return

        when instruct_value_in_romans(message)
            match = message.match(/([A-Za-z]*) is ([A-Za-z]*)/)
            ALIASES[match[1]] = match[2]

            return
        else
            raise "pattern not found"
        end

    end

    def instruct_value_in_credits (message)
        /Credits$/ =~ message
    end

    def instruct_value_in_romans (message)
        /([A-Za-z]*) is ([A-Za-z]*)/ =~ message
    end

    def questionate (question)
        case
        when how_many_question(question)
            match = question.match(/is ([A-Za-z ]*) ([A-Za-z]+) ?/)
            symbols_aliases = match[1]
            item = match[2]

            units = get_value_from_symbols_aliases(symbols_aliases)
            credits = ITENS_CREDITS[item] * units

            return "#{symbols_aliases} #{item} is #{credits} Credits"
        when how_much_question(question)
            match = question.match(/how much is ([A-Za-z ]*) ?/)

            symbol_alias = match[1]
            symbol_alias.strip!
            value = get_value_from_symbols_aliases(symbol_alias)
            return "#{symbol_alias} is #{value}"
        else

            raise "I have no idea what you are talking about"
        end

    end

    def how_many_question (question)
        /^how many Credits is ([A-Za-z ]*) ([A-Za-z]+) ?/ =~ question
    end

    def how_much_question (question)
        /^how much is ([A-Za-z ]*) ?/ =~ question
    end

    def get_value_from_symbols_aliases (symbol_alias)
        roman_vesion = convert_aliases_to_roman (symbol_alias)
        @roman_converter.input_symbols = roman_vesion
        @roman_converter.convert
    end

    def convert_aliases_to_roman (str)
        result = ""
        str.split(" ").each do |part|
            result << ALIASES[part]
        end
        result
    end
end

