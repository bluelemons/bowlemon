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
