class Prospect < ApplicationRecord
  has_many :items
  has_many :options, through: :items
end
