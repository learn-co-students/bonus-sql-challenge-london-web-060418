require 'bundler'
Bundler.require
require 'sqlite3'
# Setup a DB connection here

require_relative '../db/parse.rb'
require_relative '../db/guests.rb'
require_relative '../db/seed.rb'

@database_connection = SQLite3::Database.new(":memory:")

@database_connection.execute("CREATE TABLE IF NOT EXISTS guests (id INTEGER PRIMARY KEY, year TEXT, occupation TEXT, show TEXT, group_show TEXT, name TEXT)")

 Guest.make_db(@database_connection)
