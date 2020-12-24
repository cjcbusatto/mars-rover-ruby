class Plateau
    def initialize(x, y)
        @x = x
        @y = y
    end

    def in(position)
        unless (0..@x).include?(position.x) && (0..@y).include?(position.y)
            raise RuntimeError, "Outside Plateu Plateau borders!"
        end
    end
end