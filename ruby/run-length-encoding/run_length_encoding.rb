module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(string)
    string.scan(/((.)\2*)/).inject('') do |encoded, (repeated, letter)|
      size = repeated.chars.size
      encoded << size.to_s if size > 1
      encoded << letter
    end
  end

  def self.decode(string)
    string.scan(/(\d+)?(\D)/i).inject('') do |decoded, (repeat, letter)|
      repeat = repeat.to_i
      repeat = 1 if repeat.zero?

      decoded << letter[0] * repeat
    end
  end
end
