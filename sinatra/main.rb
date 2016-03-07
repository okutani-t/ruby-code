# coding: utf-8

require 'sinatra'
require 'sinatra/reloader'
require 'json'

puts "access"

get '/:sentence' do
  res = hello(params[:sentence])
  "さくらちゃん：「#{res}」"
end

def hello(s)
  if(/ばー*か/ =~ s)
    return "バカとか言うな！"
  end
  return s + "!!"
end
