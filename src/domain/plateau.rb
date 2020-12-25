class Plateau
  def initialize(x, y)
    @x = x
    @y = y
  end

  def in(position)
    raise RuntimeError, "Outside Plateau borders!" unless (0..@x).include?(position.x) && (0..@y).include?(position.y)

    true
  end
end