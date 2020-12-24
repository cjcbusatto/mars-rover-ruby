require '../src/rover'
require '../src/domain/position'
require '../src/domain/plateau'

describe "End to End Testing" do
    it 'given a set of commands, it should match the end position' do
      plateau = Plateau.new(5, 5)
      position = Position.new(1, 2, :N)
      rover = Rover.new(plateau, position)
  
      commands = "LMLMLMLMM".chars.map { |c| c.to_sym }
      commands.each { |c| rover.run(c) }

      expect(rover.get_current_position).to have_attributes(x: 1, y: 3, direction: :N)
    end
  
    it 'given a set of commands, it should match the end position' do
        plateau = Plateau.new(5, 5)
        position = Position.new(3, 3, :E)
        rover = Rover.new(plateau, position)
    
        commands = "MMRMMRMRRM".chars.map { |c| c.to_sym }
        commands.each { |c| rover.run(c) }
  
        expect(rover.get_current_position).to have_attributes(x: 5, y: 1, direction: :E)
      end
  end
  