require_relative '../app/controllers/uprn_finder.rb'

describe "UPRN for all properties in area" do
  it 'returns the correct UPRN of the building with toid osgb1000007202865' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("100022228818")
  end
  it 'returns the correct UPRN of the building with toid osgb1000006756560' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("UPRN not available")
  end
  it 'returns the correct UPRN of the building with toid osgb1000007202189' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("100022244420")
  end
end