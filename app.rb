#requires for all environments
require 'sinatra'
require 'slim'
require 'sqlite3'
require 'dm-sqlite-adapter'
require 'data_mapper'

#modelos
require './models/game'
require './models/player'
require './models/score'

#environment
require "./config/#{ ENV["RACK_ENV"]  || 'development' }"

DataMapper.finalize
DataMapper.auto_upgrade!

get '/games/new' do
  slim :new
end

post '/games' do
  @game = Game.new params
  if @game.save
    redirect "/lines/#{ @game.line }"
  else
    slim :new
  end
end

get '/lines/:line' do
  @game = Game.last(line: params[:line])
  slim :game
end

put '/lines/:line' do
  @game = Game.last(line: params[:line])
  @game << params["shoot"].to_i
end
