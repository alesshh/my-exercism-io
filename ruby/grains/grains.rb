class Grains
  def self.square(size)
    2 ** (size - 1)
  end

  def self.total
    square(65) - 1
  end
end
