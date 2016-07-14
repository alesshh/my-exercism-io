class ETL
  def self.transform(old)
    old.each_with_object({}) do |(value, keys), new_data|
      items = keys.map(&:downcase).zip([value] * keys.size)

      new_data.merge!(Hash[items])
    end
  end
end
