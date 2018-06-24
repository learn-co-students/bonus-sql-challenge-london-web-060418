# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "pry"

require_relative './parse.rb'
require_relative './guests.rb'

guests_arr = parse

guests_arr.shift

# create new instances of guest class through parsed CSV file
guests_arr.each do |guest|
  Guest.new(year: guest[0], occupation: guest[1], show: guest[2], group_show: guest[3], name: guest[4])
end
