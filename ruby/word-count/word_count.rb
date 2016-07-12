module BookKeeping
  VERSION = 1
end

class Phrase < Struct.new(:phrase)
  def words
    @words ||= phrase.to_s.downcase.scan(/\b[a-z0-9']+\b/)
  end

  def word_count
    @word_count ||= words.each_with_object({}) do |word, group|
      group[word] = group[word].to_i + 1
    end
  end
end
