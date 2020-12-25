class Command
  def execute(position)
    raise "Error: theres no implementation"
  end

  def check(command, direction)
    raise "Error: theres no implementation"
  end
end

class NorthCommand < Command
  def execute(position)
    Position.new(position.x, position.y + 1, position.direction)
  end

  def check(command, direction)
    command == :M && direction == :N
  end
end

class SouthCommand < Command
  def execute(position)
    Position.new(position.x, position.y - 1, position.direction)
  end

  def check(command, direction)
    command == :M && direction == :S
  end
end

class WestCommand < Command
  def execute(position)
    Position.new(position.x - 1, position.y, position.direction)
  end

  def check(command, direction)
    command == :M && direction == :W
  end
end

class EastCommand < Command
  def execute(position)
    Position.new(position.x + 1, position.y, position.direction)
  end

  def check(command, direction)
    command == :M && direction == :E
  end
end

class RotateRightCommand < Command
  def execute(position)
    rotate_map = { :N => :E, :E => :S, :S => :W, :W => :N }
    Position.new(position.x, position.y, rotate_map[position.direction])
  end

  def check(command, _)
    command == :R
  end
end

class RotateLeftCommand < Command
  def execute(position)
    rotate_map = { :N => :W, :W => :S, :S => :E, :E => :N }

    Position.new(position.x, position.y, rotate_map[position.direction])
  end

  def check(command, _)
    command == :L
  end
end