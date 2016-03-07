
require 'sinatra'
require 'sinatra/reloader'
require 'json'

get '/' do
  v = {
    key1: "hello! sinatra",
  }
  v.to_json
end

get '/hello/?:name?' do |n|
  "Hello World!#{n}!"
end

get '/show' do
  "hello!show!"
end

get '/foo' do
  "hello!foo!"
end
