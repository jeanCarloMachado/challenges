puts "Guess a number between 0 and 9"
rnd = Random.new
answer = rnd.rand(0..9)
given= 999
while answer != given
	puts  "Give a number:"
	given = gets.chomp.to_i
	if given < answer
		puts 'Too low'
	elsif given > answer
		puts 'Too high'
	end
end

puts "You Got it"
