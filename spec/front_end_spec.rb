require 'spec_helper'
require_relative '../cladding_app.rb'

describe 'test for insuring the frontend is working correctly' do
    it 'returns status 200 OK' do
        get '/'
        assert last_response.ok?
    end
end