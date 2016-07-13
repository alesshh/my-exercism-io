class PhoneNumber
  INVALID = ('0' * 10).freeze

  attr_reader :digits
  def initialize(string)
    @digits = string.gsub(/[a-z]/, INVALID).scan(/\d/)
  end

  def number
    @number ||= valid_digits
  end

  def area_code
    @area_code ||= number[0..2]
  end

  def to_s
    @to_s ||= number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  def valid_digits
    digits.shift if digits[0] == '1' && digits.size == 11
    return INVALID if digits.size != 10

    digits.join
  end
end
