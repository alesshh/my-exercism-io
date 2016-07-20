module BookKeeping
  VERSION = 1
end

class Frame
  MAX_PINS = 10.freeze

  attr_reader :throws, :board
  def initialize
    @throws = 0
    @board = MAX_PINS
  end

  def add!(pins)
    raise RuntimeError if pins > board

    @throws += 1
    @board -= pins
  end

  def empty_board?
    board == 0
  end

  def strike?
    empty_board? && throws == 1
  end

  def spare?
    empty_board && throws == 2
  end

  def complete?
    empty_board? || throws == 2
  end

  def score
    MAX_PINS - board
  end
end

class Game
  def initialize
    @frames = []
  end

  def roll(pins)
    raise(RuntimeError, 'Should not be able to roll after game is over') if complete?
    
    current_frame.add!(pins)
  end

  def complete?
    frames.count(&:complete?) == 10
  end

  def score
    raise(RuntimeError, 'Score cannot be taken until the end of the game') unless complete?

    frames.map(&:score).reduce(0, :+)
  end

  private

  attr_reader :frames

  def current_frame
    return @current_frame if @current_frame && !@current_frame.complete?

    @current_frame = Frame.new
    frames << @current_frame
    @current_frame
  end
end
