require 'sinatra'

get '/' do
    erb :index
end

get '/result' do
    erb :result
end