class Frame
  def initialize(board, position)
    @position = position
    @board = board
    @pins = 10
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
    @pins -= pins
  end

  def first_roll
    @rolls.first
  end

  def done?
    @rolls.size == 2 || @pins.zero?
  end

  def open?
    !done?
  end

  def spare?
    @pins.zero? && @rolls.size == 2
  end

  def strike?
    @pins.zero? && @rolls.size == 1
  end

  def frame_score
    10 - @pins
  end

  def extra_score
    return strike_extra_score if strike?
    return spare_extra_score if spare?

    0
  end

  def total_score
    frame_score + extra_score
  end

  private

  def strike_extra_score
    frames = @board.frames
    first_next_frame = frames[@position + 1]

    return first_next_frame.frame_score if first_next_frame && !first_next_frame.strike?

    second_frame_score = frames[@position + 2]

    first_next_frame.frame_score + (second_frame_score && second_frame_score.first_roll).to_i
  end

  def spare_extra_score
    next_frame = @board.frames[@position + 1]

    (next_frame && next_frame.first_roll).to_i
  end
end

class Game
  attr :frames
  def initialize
    @frames = []
  end

  def roll(pins)
    current_frame.roll pins
  end

  def score
    frames.map(&:total_score).reduce(0, :+)
  end

  private

  def current_frame
    last = @frames.last

    return last if last && last.open?

    last = Frame.new(self, @frames.size)
    @frames << last

    last
  end
end
