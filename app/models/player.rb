class Player < ApplicationRecord
  belongs_to :team
  validates :first_name, presence: true
  validates :jersey_number, numericality: { only_integer: true }
end
