module BookKeeping
  VERSION = 2
end

class BeerSong
  FROM = {
    0 => "No more bottles of beer on the wall, no more bottles of beer.\n",
    1 => "1 bottle of beer on the wall, 1 bottle of beer.\n",
    :other => "%{counter} bottles of beer on the wall, %{counter} bottles of beer.\n"
  }.freeze

  TO = {
    0..-1 => "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
    1..0 => "Take it down and pass it around, no more bottles of beer on the wall.\n",
    2..1 => "Take one down and pass it around, 1 bottle of beer on the wall.\n",
    :other => "Take one down and pass it around, %{counter} bottles of beer on the wall.\n"
  }.freeze

  def verse(number)
    previous = number - 1

    verse = FROM[number] || (FROM[:other] % {counter: number})
    verse += TO[number..previous] || (TO[:other] % {counter: previous})
  end

  def verses(from, to)
    from.downto(to).map(&method(:verse)).join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
