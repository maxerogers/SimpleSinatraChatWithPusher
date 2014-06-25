#app.rb
#This is the sinatra backend

require 'rubygems'
require 'sinatra'
require './model.rb'
require 'pusher'

set :public_folder, Proc.new { File.join(root, "public") }
Pusher.url = "http://8c0bcee100b50a1d7826:6e64b8424aee60e380dd@api.pusherapp.com/apps/79094"


get '/' do 
	@messages = Message.all
	erb :index
end

post '/' do 
	Message.create(username: params[:username],data: params[:data])
	@messages = Message.all
	Pusher['test_channel'].trigger('my_event', {
		message: params[:data]
	})
	erb :index
end

