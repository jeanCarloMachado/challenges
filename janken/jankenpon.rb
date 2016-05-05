require "test/unit"


class Jankenpon 

  STONE = 1
  SCISSORS = 2
  PAPER = 3

  EVEN = 0
  PLAYER_ONE_WINS = -1
  PLAYER_TWO_WINS = 1

  COMBINATIONS = [
    [ STONE, STONE, EVEN ],
    [ PAPER, PAPER, EVEN ],
    [ SCISSORS , SCISSORS, EVEN ],
    [ PAPER, STONE, PLAYER_ONE_WINS ],
    [ STONE, PAPER, PLAYER_TWO_WINS ],
    [ SCISSORS, PAPER, PLAYER_ONE_WINS ],
    [ PAPER, SCISSORS, PLAYER_TWO_WINS ],
    [ STONE, SCISSORS, PLAYER_ONE_WINS ],
    [ SCISSORS, STONE, PLAYER_TWO_WINS ]
  ]
 
  def initialize(playerOne, playerTwo)
    @playerOne = playerOne
    @playerTwo = playerTwo
  end

  def getResult
      COMBINATIONS.each { |combination| 
        if combination.at(0)  ==  @playerOne && combination.at(1)  ==  @playerTwo
            return combination.at(2)
        end
      }
  end
end

 
class TestJankenpon < Test::Unit::TestCase
  def test_even_when_options_are_same
    assert_equal(Jankenpon::EVEN, Jankenpon.new(Jankenpon::STONE, Jankenpon::STONE).getResult())
    assert_equal(Jankenpon::EVEN, Jankenpon.new(Jankenpon::SCISSORS, Jankenpon::SCISSORS).getResult())
    assert_equal(Jankenpon::EVEN, Jankenpon.new(Jankenpon::PAPER, Jankenpon::PAPER).getResult())
  end

  def test_paper_wins_stone
    assert_equal(Jankenpon::PLAYER_ONE_WINS, Jankenpon.new(Jankenpon::PAPER, Jankenpon::STONE).getResult())
    assert_equal(Jankenpon::PLAYER_TWO_WINS, Jankenpon.new(Jankenpon::STONE, Jankenpon::PAPER).getResult())
  end

  def test_paper_loses_scissors
    assert_equal(Jankenpon::PLAYER_ONE_WINS, Jankenpon.new(Jankenpon::SCISSORS, Jankenpon::PAPER).getResult())
    assert_equal(Jankenpon::PLAYER_TWO_WINS, Jankenpon.new(Jankenpon::PAPER, Jankenpon::SCISSORS).getResult())
  end

  def test_stone_wins_scissors
    assert_equal(Jankenpon::PLAYER_ONE_WINS, Jankenpon.new(Jankenpon::STONE, Jankenpon::SCISSORS).getResult())
    assert_equal(Jankenpon::PLAYER_TWO_WINS, Jankenpon.new(Jankenpon::SCISSORS, Jankenpon::STONE).getResult())
  end
end

