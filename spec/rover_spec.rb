require '../src/rover'
require '../src/position'

describe Rover, '#run' do
  context 'when the command is M' do
    it 'moves to north' do
      start_position = Position.new 1, 2, :N
      rover = Rover.new start_position

      rover.run(:M)

      expect(rover.get_current_position).to have_attributes(x: 1, y: 3, direction: :N)
    end
    it 'moves to south' do
      start_position = Position.new 1, 2, :S
      rover = Rover.new start_position

      rover.run(:M)

      expect(rover.get_current_position).to have_attributes(x: 1, y: 1, direction: :S)
    end
    it 'moves to east' do
      start_position = Position.new 1, 2, :W
      rover = Rover.new start_position

      rover.run(:M)

      expect(rover.get_current_position).to have_attributes(x: 0, y: 2, direction: :W)
    end
    it 'moves to west' do
      start_position = Position.new 1, 2, :E
      rover = Rover.new start_position

      rover.run(:M)

      expect(rover.get_current_position).to have_attributes(x: 2, y: 2, direction: :E)
    end
  end

  context 'when the command os L' do
    it 'rotates left the rover' do
      start_position = Position.new 1, 2, :N
      rover = Rover.new start_position

      rover.run(:L)

      expect(rover.get_current_position).to have_attributes(x: 1, y: 2, direction: :W)
    end
  end

  context 'when the command os R' do
    it 'rotates right the rover' do
      start_position = Position.new 1, 2, :N
      rover = Rover.new(start_position)

      rover.run(:R)

      expected_position = Position.new 1, 2, :E
      expect(rover.get_current_position).to have_attributes(x: 1, y: 2, direction: :E)
    end
  end
end
