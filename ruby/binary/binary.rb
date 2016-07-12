module BookKeeping
  VERSION = 2
end

class Binary
  attr_reader :string
  def initialize(string)
    raise ArgumentError if string.match(/\D|[2-9]/)

    @string = string
  end

  def to_decimal
    string.chars.reverse.map.with_index do |char, index|
      char.to_i * (2 ** index)
    end.reduce(:+)
  end
end
