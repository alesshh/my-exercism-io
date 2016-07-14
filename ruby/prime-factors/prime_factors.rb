require 'prime'

class PrimeFactors
  def self.for(number)
    number.prime_division.flat_map do |val|
      Array.new(val[1], val[0])
    end
  end
end
