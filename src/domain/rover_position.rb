require_relative 'coordinates'

class RoverPosition < Coordinates
  attr_reader :direction

  def initialize(x, y, direction)
    super(x, y)
    @direction = direction
  end
end
