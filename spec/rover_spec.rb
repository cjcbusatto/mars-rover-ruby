require '../src/rover'
require '../src/domain/rover_position'
require '../src/domain/plateau'

describe Rover, '#run' do
  context 'when the command is M' do
    it 'moves to north' do
      start_position = RoverPosition.new 1, 2, :N
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:M)

      expect(rover.position).to have_attributes(x: 1, y: 3, direction: :N)
    end
    it 'moves to south' do
      start_position = RoverPosition.new 1, 2, :S
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:M)

      expect(rover.position).to have_attributes(x: 1, y: 1, direction: :S)
    end
    it 'moves to east' do
      start_position = RoverPosition.new 1, 2, :W
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:M)

      expect(rover.position).to have_attributes(x: 0, y: 2, direction: :W)
    end
    it 'moves to west' do
      start_position = RoverPosition.new 1, 2, :E
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:M)

      expect(rover.position).to have_attributes(x: 2, y: 2, direction: :E)
    end

    it 'runtime error' do
      start_position = RoverPosition.new 5, 5, :N
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      expect { rover.run(:M) }.to output("Rescued: #<RuntimeError: Outside Plateau borders!>\n").to_stdout
    end
  end

  context 'when the command os L' do
    it 'rotates left the rover' do
      start_position = RoverPosition.new 1, 2, :N
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:L)

      expect(rover.position).to have_attributes(x: 1, y: 2, direction: :W)
    end
  end

  context 'when the command os R' do
    it 'rotates right the rover' do
      start_position = RoverPosition.new 1, 2, :N
      plateau = Plateau.new(5, 5)

      rover = Rover.new(plateau, start_position)

      rover.run(:R)

      expected_position = RoverPosition.new 1, 2, :E
      expect(rover.position).to have_attributes(x: 1, y: 2, direction: :E)
    end
  end
end
