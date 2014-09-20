require 'pry'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/test.db")
