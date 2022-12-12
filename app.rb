require 'sinatra'

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
    erb :result
end