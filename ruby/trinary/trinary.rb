module BookKeeping
  VERSION = 1
end

class Trinary

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if string.match(/\D|[4-9]/)

    string.reverse.chars.map.with_index do |char, index|
      char.to_i * (3 ** index)
    end.reduce(:+)
  end
end
