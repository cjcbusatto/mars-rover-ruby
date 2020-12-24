require_relative 'commands'

class Rover
    def initialize(plateau, start_position)
        @plateau = plateau
        @positions = [start_position]
    end

    def run(input_command)
        current_position = get_current_position
        
        command = find_command(input_command, current_position)
    
        begin
            new_position = command.execute(current_position)
            @plateau.in(new_position)
            @positions.push(new_position)
        rescue RuntimeError => e
            puts "Rescued: #{e.inspect}" 
        end
    end

    def find_command(input_command, current_position)
        commands = [ 
            NorthCommand.new, 
            SouthCommand.new, 
            WestCommand.new, 
            EastCommand.new, 
            RotateRightCommand.new, 
            RotateLeftCommand.new,
        ]

        commands.find { |command| command.check(input_command, current_position.direction) }
    end

    def get_current_position
        @positions.last
    end
end