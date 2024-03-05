class Feature < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :filters
  has_many :items
end
