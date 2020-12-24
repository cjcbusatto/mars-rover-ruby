class Rover
    def initialize(start_position)
        @positions = []
        @positions.push(start_position)
    end

    def run(command)
        current_position = @positions.last
        if command == :M
           move_forward(current_position)
        elsif command == :R
            rotate_right(current_position)
        else command == :L
            rotate_left(current_position)
        end
    end

    def get_current_position
        @positions.last
    end

    private
    def move_forward(position)
        if position.direction == :N
            new_position = Position.new(position.x, position.y + 1, :N)       
        elsif position.direction == :S
            new_position = Position.new(position.x, position.y - 1, :S)
        elsif position.direction == :W
            new_position = Position.new(position.x - 1, position.y, :W)
        else
            new_position = Position.new(position.x + 1, position.y, :E)
        end

        @positions.push(new_position)
    end

    def rotate_right(position)
        rotate_map = { :N => :E, :E => :S, :S => :W, :W => :N}
        new_position = Position.new(position.x, position.y, rotate_map[position.direction])
        @positions.push(new_position)
    end
    
    def rotate_left(position)
        rotate_map = { :N => :W, :W => :S, :S => :E, :E => :N}
        new_position = Position.new(position.x, position.y, rotate_map[position.direction])
        @positions.push(new_position)
    end
end