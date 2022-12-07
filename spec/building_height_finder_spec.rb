require_relative '../Back_end/building_height_finder.rb'

describe 'Heights for all properties over 18m in the area ' do
    it 'returns the first height over 18m in an area' do
        expect(building_height_finder([0.0085, 51.564], [0.1166, 51.6314])).to include(28.37)
    end
end
