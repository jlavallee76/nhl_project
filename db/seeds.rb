# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "json"

# Fetches and decodes all team data from the NHL stats API
def team_fetch(url)
  JSON.parse(open(url).read)
end

# Gets specific team data based on the team id passed
def team_info(id)
  team_fetch("https://statsapi.web.nhl.com/api/v1/teams/#{id}")
end

team_ids = 1..30
team_ids.each do |team_id|
  team = team_info(team_id)
  puts team["teams"][0]["name"]
  puts team["teams"][0]["venue"]["name"]
  puts team["teams"][0]["firstYearOfPlay"]
  puts team["teams"][0]["conference"]["name"]
  puts team["teams"][0]["division"]["name"]
  puts team["teams"][0]["officialSiteUrl"]
end
