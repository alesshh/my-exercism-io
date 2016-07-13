class SumOfMultiples
  attr_reader :numbers

  def initialize(*numbers)
    @numbers = numbers
  end

  def min
    @min ||= numbers.min
  end

  def to(number)
    min.upto(number - 1).select do |i|
      numbers.any? { |num| (i % num).zero? }
    end.reduce(:+).to_i
  end
end
