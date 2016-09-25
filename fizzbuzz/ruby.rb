class FizzBuzz
  def initialize
    @printed = nil
    @printers = [
      lambda { |x| print ( @printed = "Fizz" ) if x % 3 == 0},
      lambda { |x| print ( @printed = "Buzz" ) if x % 5 == 0},
      lambda { |x| print ( @printed = "Bazz" ) if x % 7 == 0}
    ]
  end

  def for_num(i)
    @printed = nil
    @printers.each { |l| l.call(i) }
    print i unless @printed
    puts
  end

  def run(x = 100)
    (1..x).to_a.each { |i| for_num(i) }
  end
end

FizzBuzz.new.run(ARGV.first || 100)
