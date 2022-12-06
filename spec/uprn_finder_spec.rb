require_relative '../Back_end/uprn_finder.rb'

describe "UPRN for all properties in area" do
  it 'returns a UPRN in a given area' do
    expect(properties_in_area([0.0085, 51.564], [0.1166, 51.6314])).to include("123456789012")
  end
end