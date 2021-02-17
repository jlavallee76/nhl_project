class AddVenueToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :venue, :string
  end
end
