require 'sinatra'
require_relative 'app/controllers/uprn_finder.rb'

configure do
    set :views, "./app/views"
    set :public_dir, "./public"
    set :bind, '0.0.0.0'
    set :port, 10000
    set :environment, :production
end
get '/' do
    erb :index
end

get '/result' do
    erb :result, {locals: { uprn_list: uprn_finder([0.0085, 51.564], [0.1166, 51.6314])}}
end