require_relative '../Back_end/toid_from_ngd_api.rb'

describe 'toid for all properties over 18m in the area ' do
    it 'returns the toid osgb1000013035594 of a building over 18m in given area' do
        expect(tall_building_toid_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("osgb1000013035594")
    end
    it 'returns the toid osgb1000012978282 of a building over 18m in given area' do
      expect(tall_building_toid_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("osgb1000012978282")
  end
  it 'returns the toid osgb1000012979300 of a building over 18m in given area' do
    expect(tall_building_toid_finder([0.0085, 51.564], [0.1166, 51.6314])).to include("osgb1000012979300")
  end
  it 'does not return osgb5000005250672334 for a building under 18m in given area' do
    expect(tall_building_toid_finder([0.0085, 51.564], [0.1166, 51.6314])).not_to include("osgb5000005250672334")
  end
end