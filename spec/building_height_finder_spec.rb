require_relative '../Back_end/building_height_finder.rb'

describe 'Heights for all properties over 18m in the area ' do
    it 'returns the first building with height over 18m in an area' do
        expect(building_height_finder([0.0085, 51.564], [0.1166, 51.6314])).to include(28.37)
    end
    it 'returns the second building with height over 18m in an area' do
        expect(building_height_finder([0.0085, 51.564], [0.1166, 51.6314])).to include(28.79)
    end
    it 'does not return buildings with height under 18m in an area' do
        expect(building_height_finder([0.0085, 51.564], [0.1166, 51.6314])).not_to include(7.49)
    end
end
