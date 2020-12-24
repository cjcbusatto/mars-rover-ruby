require '../src/domain/plateau'
require '../src/domain/position'

describe Plateau do
  it 'should raise an exception when is outside of plateau borders' do
    plateau = Plateau.new(5, 5)

    position = Position.new(6, 5, :N)

    expect { plateau.in(position) }.to raise_error(RuntimeError)
  end

  it 'should give no errors when is in the plateau borders' do
    p = Plateau.new(5, 5)

    pos = Position.new(5, 5, :N)

    expect { plateau.in(position) }.not_to raise_error(RuntimeError)
  end
end
