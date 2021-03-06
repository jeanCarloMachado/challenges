require "test/unit"

class FatoresPrimos
	PRIMES = [
		1, 2, 3
	]

	def initialize(source)
		@source = source
	end

	def getResult

		PRIMES.each { |prime|
			if (@source == prime)
				return [@source]
			end
		}
		result = []

		while @source % 2 == 0 do
			@source  = @source/2
			result.push(2)
		end

		if @source % 3 == 0
			result.push(3)
		end

		result;
	end
end

class TestFatoresPrimos < Test::Unit::TestCase
	def test_prime_when_prime_is_passed
		assert_equal([3], FatoresPrimos.new(3).getResult())
		assert_equal([1], FatoresPrimos.new(1).getResult())
	end

	def test_first_prime_of_pair_is_two
		assert_equal(2, FatoresPrimos.new(4).getResult().at(0))
		assert_equal(2, FatoresPrimos.new(2).getResult().at(0))
	end

	def test_number_compost_of_two_primes
		assert_equal([2, 3], FatoresPrimos.new(6).getResult())
	end

	def test_number_compost_of_tree_primes
		assert_equal([2, 2, 3], FatoresPrimos.new(12).getResult())
	end
end
