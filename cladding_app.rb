require 'sinatra'

configure do
    set :views, "views"
    set :public_dir, "public"
    set :bind, '0.0.0.0'
    set :port, 10000
end
get '/' do
    erb :index
end

get '/result' do
    erb :result
end