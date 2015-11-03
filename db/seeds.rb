# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Only works in development,
# run heroku pg:psql \copy listings FROM 'db/listings.csv' WITH CSV on production
Listing.connection.execute("COPY listings FROM '#{Dir.pwd}/db/listings.csv' DELIMITER ',' CSV;")
