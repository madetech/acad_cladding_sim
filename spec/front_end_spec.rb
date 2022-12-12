require_relative '../app.rb'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'Cladding App test suite' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should load the home page" do
    get '/'
    puts last_response
    expect(last_response).to be_ok
  end

  it "should not load the home page" do
    get '/home'
    expect(last_response).to_not be_ok
  end

  it "should load the other page" do
    get '/result'
    expect(last_response).to be_ok
  end
end


