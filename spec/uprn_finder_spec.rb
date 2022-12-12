require_relative '../app/controllers/uprn_finder.rb'

describe "UPRN for all properties in area" do
  it 'returns the correct UPRN of the building with toid osgb1000013035594' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("100062426862")
  end
  it 'returns the correct UPRN of the building with toid osgb1000012978282' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("100060482125")
  end
  it 'returns the correct UPRN of the building with toid osgb1000012979300' do
    expect(uprn_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("100060477565")
  end
end