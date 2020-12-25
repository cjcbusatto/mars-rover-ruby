require_relative 'commands'

class Rover
  attr_reader :position

  def initialize(plateau, start_position)
    @plateau = plateau
    @position = start_position
  end

  def run(input_command)
    command = find_command(input_command, @position)

    begin
      new_position = command.execute(@position)

      @position = new_position if @plateau.in(new_position)
    rescue RuntimeError => e
      puts "Rescued: #{e.inspect}"
    end
  end

  def find_command(input_command, current_position)
    commands = [NorthCommand.new, SouthCommand.new, WestCommand.new, EastCommand.new, RotateRightCommand.new, RotateLeftCommand.new]

    commands.find { |command| command.check(input_command, current_position.direction) }
  end
end