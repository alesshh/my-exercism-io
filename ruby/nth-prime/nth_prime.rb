require 'prime'

class Prime
  def self.nth(number)
    raise ArgumentError if number.zero?

    possible = 2
    counter = 1

    until counter == number
      possible += 1
      counter += 1 if possible.prime?
    end

    possible
  end
end
