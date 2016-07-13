class Array
  def keep
    filtered = []

    self.each do |item|
      filtered << item if block_given? && yield(item)
    end

    filtered
  end

  def discard
    keep do |item|
      block_given? && !yield(item)
    end
  end
end
