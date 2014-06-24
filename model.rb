#model.rb
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "db.sqlite3"}

class Message < ActiveRecord::Base
  validates_presence_of :username, :data
end