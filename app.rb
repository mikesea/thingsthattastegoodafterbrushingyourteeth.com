require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/' do
  erb :index
end