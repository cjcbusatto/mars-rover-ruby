require_relative 'coordinates'

class Plateau < Coordinates
  def in(position)
    raise RuntimeError, "Outside Plateau borders!" unless inside_plateau?(position)

    true
  end

  private

  def inside_plateau?(position)
    (0..@x).include?(position.x) && (0..@y).include?(position.y)
  end
end