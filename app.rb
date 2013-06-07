require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/' do
  @thing = DB['SELECT * FROM things ORDER BY random() LIMIT 1'].first
  erb :index
end

get '/things/new' do
  erb :new
end

post '/things' do
  DB[:things].insert(:name => params['name'], :url => params['url'])
  redirect '/'
end