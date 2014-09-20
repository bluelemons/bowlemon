#requires for all environments
require 'sinatra'
require 'slim'
require 'sqlite3'
require 'dm-sqlite-adapter'

#modelos
require './models/game'
require './models/player'
require './models/score'

#environment
require "./config/#{ ENV["RACK_ENV"]  || 'development' }"

DataMapper.finalize
