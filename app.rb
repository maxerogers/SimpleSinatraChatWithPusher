#app.rb
#This is the sinatra backend

require 'rubygems'
require 'sinatra'
require './model.rb'

set :public_folder, Proc.new { File.join(root, "public") }

get '/' do 
	@messages = Message.all
	erb :index
end

post '/' do 
	Message.create(username: params[:username],data: params[:data])
	@messages = Message.all
	erb :index
end

