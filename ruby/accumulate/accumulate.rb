class Array
  def accumulate
    result = []

    self.each do |item|
      result << yield(item) if block_given?
    end

    result
  end
end
