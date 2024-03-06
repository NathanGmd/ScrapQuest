class Research < ApplicationRecord
  belongs_to :user
  has_many :filters
  has_many :options, through: :filters
end
