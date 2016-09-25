load "bot.rb"

bot = Bot.Factory()

File.open(ARGV[0]).each do |line|
    answer = bot.talk(line)
    puts answer if answer
end

