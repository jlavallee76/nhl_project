class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbreviation
      t.integer :first_year
      t.string :conference
      t.string :division
      t.string :web_site

      t.timestamps
    end
  end
end
