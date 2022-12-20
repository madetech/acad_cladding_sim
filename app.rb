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
    erb :start
end

get '/select' do
    erb :index
end

get '/result' do
    $local_authority_coordinates = params[:bbox_coordinates]
    erb :result, {locals: { all_buildings_details: uprn_finder()}}
end
