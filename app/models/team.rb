class Team < ApplicationRecord
  # has_many :players
  validates :name, uniqueness: true
  validates :name, :abbreviation, :first_year, :conference, :division, :venue, :web_site,
            presence: true
  validates :first_year, numericality: { only_integer: true }
end
