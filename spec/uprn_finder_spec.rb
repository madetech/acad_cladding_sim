require_relative '../app/controllers/uprn_finder.rb'

describe "UPRN for all properties in area" do
  it 'returns the first UPRN of a building in a given area' do
    expect(properties_in_area([0.0085, 51.564], [0.1166, 51.6314])).to include("123456789012")
  end
  it "returns the UPRN for a second building in a given area" do
    expect(properties_in_area([0.0085, 51.564], [0.1166, 51.6314])).to include("098765432112")
  end
end