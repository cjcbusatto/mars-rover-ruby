require '../src/domain/plateau'
require '../src/domain/rover_position'

describe Plateau do
  it 'should raise an exception when is outside of plateau borders' do
    plateau = Plateau.new(5, 5)

    position = RoverPosition.new(6, 5, :N)

    expect { plateau.in(position) }.to raise_error(RuntimeError)
  end

  it 'should give no errors when is in the plateau borders' do
    plateau = Plateau.new(5, 5)

    position = RoverPosition.new(5, 5, :N)

    expect(plateau.in(position)).to be true
  end
end
