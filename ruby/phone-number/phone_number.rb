class PhoneNumber
  INVALID = ('0' * 10).freeze

  def self.parse(string)
    parsed = string.gsub(/[a-z]/, INVALID).scan(/\d/)
    parsed.shift if parsed[0] == '1' && parsed.size == 11
    return INVALID if parsed.size != 10

    parsed.join
  end

  attr_reader :number
  
  def initialize(string)
    @number = self.class.parse(string)
  end

  def area_code
    @area_code ||= number[0..2]
  end

  def to_s
    @to_s ||= number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
end
