require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == [ENV['USER'], ENV['PASSWORD']]
  end
end

get '/' do
  @thing = DB['SELECT * FROM things ORDER BY random() LIMIT 1'].first
  erb :show
end

get '/things/new' do
  protected!
  erb :new
end

post '/things' do
  protected!
  DB[:things].insert(:name => params['name'], :url => params['url'])
  redirect '/'
end

get '/things' do
  protected!
  @things = DB[:things].all
  erb :index
end