class Feature < ApplicationRecord
  has_many :options
  has_many :filters
  has_many :items
end
