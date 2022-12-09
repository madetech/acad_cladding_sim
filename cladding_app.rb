require 'sinatra'

configure do
    set :views, "views"
    set :public_dir, "public"
end
get '/' do
    erb :index
end

get '/result' do
    erb :result
end