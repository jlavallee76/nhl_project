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
def fetch_data(url)
  JSON.parse(open(url).read)
end

def team_ids
  fetch_data("https://statsapi.web.nhl.com/api/v1/teams")
end

# Gets specific team data based on the team id passed
def team_info(id)
  fetch_data("https://statsapi.web.nhl.com/api/v1/teams/#{id}")
end

def team_roster(id)
  fetch_data("https://statsapi.web.nhl.com/api/v1/teams/#{id}/roster")
end

team_ids = 0..1
team_ids.each do |team_index|
  teams = fetch_data("https://statsapi.web.nhl.com/api/v1/teams")

  # Create Teams Here
  puts teams["teams"][team_index]["name"]
  # puts team["teams"][team_index]["venue"]["name"]
  # puts team["teams"][team_index]["firstYearOfPlay"]
  # puts team["teams"][team_index]["conference"]["name"]
  # puts team["teams"][team_index]["division"]["name"]
  # puts team["teams"][team_index]["officialSiteUrl"]
  # puts teams["teams"][team_index]["id"]

  roster = team_roster(teams["teams"][team_index]["id"])

  # Create Players Here
  puts "Roster: "
  roster["roster"].each do |player|
    puts "#{player['person']['fullName']} : #{player['position']['abbreviation']} : #{player['jerseyNumber']} : #{teams['teams'][team_index]['abbreviation']} \n"
  end
end
