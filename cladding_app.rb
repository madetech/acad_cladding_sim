require 'sinatra'

get '/' do
    erb :index

    root 'render#index'
end

get '/result' do
    erb :result
end