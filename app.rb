require 'sinatra'
require 'slim'

require "config/#{ ENV["RACK_ENV"]  || 'development' }"

get '/game/:id' do
  slim :game
end
