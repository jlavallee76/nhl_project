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

def team_roster(id)
  fetch_data("https://statsapi.web.nhl.com/api/v1/teams/#{id}/roster")
end

teams = fetch_data("https://statsapi.web.nhl.com/api/v1/teams")
teams["teams"].each do |team_index|
  # Create Teams with data fetched from NHL API
  team = Team.find_or_create_by(
    name:         team_index["name"],
    abbreviation: team_index["abbreviation"],
    first_year:   team_index["firstYearOfPlay"],
    conference:   team_index["conference"]["name"],
    division:     team_index["division"]["name"],
    web_site:     team_index["officialSiteUrl"],
    venue:        team_index["venue"]["name"]
  )

  # If the team exists and it's a valid team, create the roster of players for that team
  next unless team&.valid?

  roster = team_roster(team_index["id"])
  roster["roster"].each do |player|
    team.players.create(
      full_name:             player["person"]["fullName"],
      position:              player["position"]["name"],
      position_abbreviation: player["position"]["abbreviation"],
      jersey_number:         player["jerseyNumber"]
    )
  end
end

puts "Created #{Team.count} NHL Teams"
puts "Created #{Player.count} Players"
