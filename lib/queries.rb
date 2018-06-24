# Write methods that return SQL queries for each part of the challeng here

require_relative '../config/environment.rb'
# require_relative '../db/seed.rb'

def guest_with_most_appearances
  @database_connection.execute("SELECT guests.name, COUNT(guests.name)
  FROM guests
  GROUP BY guests.name
  ORDER BY COUNT(guests.name) DESC
  LIMIT 1")
end

# What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?
def popular_profession_by_year
  @database_connection.execute("SELECT year, occupation, num_groups
  FROM
	(SELECT year, occupation, COUNT(*) as num_groups
	FROM guests
	GROUP BY year, occupation
	) a
  GROUP BY year
  HAVING num_groups = MAX(num_groups)
  ")
end

# What profession was on the show most overall?

def popular_profession
  @database_connection.execute("SELECT occupation, COUNT(occupation)
  FROM guests
  GROUP BY occupation
  ORDER BY COUNT(occupation) DESC
  LIMIT 1")
end

# How many people did Jon Stewart have on with the first name of Bill?

def bill
  @database_connection.execute("SELECT COUNT(name)
  FROM guests
  WHERE name LIKE "Bill%"")
end

# What dates did Patrick Stewart appear on the show?

def pat_stewart
  @database_connection.execute("SELECT show
  FROM guests
  WHERE name LIKE "%Patrick Stewart%"")
end
# Which year had the most guests?

def most_guests
  @database_connection.execute("SELECT year
  FROM guests
  GROUP BY year
  ORDER BY COUNT(name) DESC
  LIMIT 1")
end
# What was the most popular "Group" for each year Jon Stewart hosted?

def popular_group
  @database_connection.execute("SELECT year, group_show, num_groups
  FROM
	(SELECT year, group_show, COUNT(*) as num_groups
	FROM guests
	GROUP BY year, group_show
	) a
  GROUP BY year
  HAVING num_groups = MAX(num_groups)")
end
