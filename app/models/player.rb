class Player < ApplicationRecord
  belongs_to :team
  validates :jersey_number, numericality: { only_integer: true }
end
