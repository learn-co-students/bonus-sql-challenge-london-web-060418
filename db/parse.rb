# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require "pry"
require "csv"

def parse
  arr_guests = CSV.read('daily_show_guests.csv')

  arr_guests
end
