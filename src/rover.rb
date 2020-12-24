require_relative 'commands'

class Rover
    def initialize(start_position)
        @positions = [start_position]
    end

    def run(input_command)
        current_position = get_current_position
        
        command = find_command(input_command, current_position)
    
        new_position = command.execute(current_position)

        @positions.push(new_position)
    end

    def find_command(input_command, current_position)
        commands = [ 
            NorthCommand.new, 
            SouthCommand.new, 
            WestCommand.new, 
            EastCommand.new, 
            RotateRightCommand.new, 
            RotateLeftCommand.new,
            UnknownCommand.new,
        ]

        commands.find { |command| command.check(input_command, current_position.direction) }
    end

    def get_current_position
        @positions.last
    end
end