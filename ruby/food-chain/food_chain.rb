module BookKeeping
  VERSION = 2
end

class FoodChain
  ANIMALS = {
    fly: nil,
    spider: "It wriggled and jiggled and tickled inside her.\n",
    bird: "How absurd to swallow a bird!\n",
    cat: "Imagine that, to swallow a cat!\n",
    dog: "What a hog, to swallow a dog!\n",
    goat: "Just opened her throat and swallowed a goat!\n",
    cow: "I don\'t know how she swallowed a cow!\n",
    horse: nil
  }.freeze

  def self.song
    accumulated_song = []
    accumulated_animals = []
    all_animals = ANIMALS.keys

    all_animals.each do |animal|
      accumulated_song << "\n" if accumulated_animals.any?

      accumulated_animals.unshift(animal)
      accumulated_song += refrain(animal)

      if animal != all_animals.last
        accumulated_song += animal_verses(accumulated_animals)
        accumulated_song << last_refrain(accumulated_animals.last)
      end
    end

    accumulated_song << last_verse
    accumulated_song.join
  end

  def self.refrain(animal)
    verses = ["I know an old lady who swallowed a #{animal}.\n"]
    verses << ANIMALS[animal]
    verses.compact
  end

  def self.last_refrain(animal, last = false)
    "I don't know why she swallowed the #{animal}. Perhaps she'll die.\n"
  end

  def self.animal_verses(accumulated_animals)
    accumulated_size = accumulated_animals.size

    accumulated_animals.each_with_object([]).with_index do |(animal, verses), index|
      next if index == 0
      swalloed = accumulated_animals[index - 1]

      if accumulated_size >= 3 && index == (accumulated_size - 2)
        verses << "She swallowed the #{swalloed} to catch the #{animal} that wriggled and jiggled and tickled inside her.\n"
      else
        verses << "She swallowed the #{swalloed} to catch the #{animal}.\n"

      end
    end
  end

  def self.last_verse
    "She's dead, of course!\n"
  end
end
