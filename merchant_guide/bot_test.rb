require "./bot"

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

        bot.instruct('glob prok Gold is 57800 Credits')

        assert_equal(
            'glob prok Gold is 57800 Credits',
            bot.questionate('how many Credits is glob prok Gold ?')
        )

        bot.instruct('pish pish Iron is 3910 Credits')

        assert_equal(
            'glob prok Iron is 780 Credits',
            bot.questionate('how many Credits is glob prok Iron ?')
        )

    end

    def test_raise_exception_on_invalid_talk

        bot = Bot.Factory()

        assert_equal(
            "I have no idea what you are talking about",
            bot.talk('how much wood could a woodchuck chuck if a woodchuck could chuck wood ?')
        )
    end
end
