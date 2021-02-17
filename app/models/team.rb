class Team < ApplicationRecord
  validates :name, :abbreviation, :first_year, presence: true
end
