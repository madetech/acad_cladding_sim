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
    puts params[:council_value]
    $coordinates = params[:council_value]
    erb :result, {locals: { uprn_list: uprn_finder(params[:council_value[0]], params[:council_value[1]])}}
end

