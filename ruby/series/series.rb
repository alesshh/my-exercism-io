class Series < Struct.new(:string)
  def slices(size)
    chars = string.chars

    raise ArgumentError if size > chars.size

    chars.each_cons(size).map do |slice|
      slice.map(&:to_i)
    end
  end
end
