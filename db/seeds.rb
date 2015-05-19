# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#--CREATE A BUNCH OF TAGS TO PLAY with
["Art", "Science", "Cats", "Geography", "Math", "C++"].each do |tag|
  Tag.create(name: tag)
end