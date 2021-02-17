json.extract! player, :id, :full_name, :position, :position_abbreviation, :jersey_number, :created_at, :updated_at
json.url player_url(player, format: :json)
