class Option < ApplicationRecord
  belongs_to :feature
  has_many :filters
  has_many :items
  has_many :prospects, through: :items
end
