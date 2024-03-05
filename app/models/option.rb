class Option < ApplicationRecord
  belongs_to :feature
  has_many :filters
  has_many :items
end
