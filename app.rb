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
  players = params[:players].split(',')
  @game = Game.new *players
  if @game.save
    redirect "/games/#{ @game.id }"
  else
    slim :new
  end
end

get '/games/:id' do
  @game = Game.first(id: params[:id])
  slim :game
end

put '/games/:id' do
  @game = Game.first(id: params[:id])
  @game << params["shoot"].to_i
end
