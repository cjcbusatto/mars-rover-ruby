require '../src/rover'
require '../src/domain/rover_position'
require '../src/domain/plateau'

describe "End to End Testing" do
  it 'given a set of commands, it should match the end position' do
    plateau = Plateau.new(5, 5)
    position = RoverPosition.new(1, 2, :N)
    rover = Rover.new(plateau, position)

    commands = [:L, :M, :L, :M, :L, :M, :L, :M, :M]

    commands.each { |c| rover.run(c) }

    expect(rover.position).to have_attributes(x: 1, y: 3, direction: :N)
  end

  it 'given a set of commands, it should match the end position' do
    plateau = Plateau.new(5, 5)
    position = RoverPosition.new(3, 3, :E)
    rover = Rover.new(plateau, position)

    commands = [:M, :M, :R, :M, :M, :R, :M, :R, :R, :M]
    commands.each { |c| rover.run(c) }

    expect(rover.position).to have_attributes(x: 5, y: 1, direction: :E)
  end
end
  