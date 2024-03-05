class Research < ApplicationRecord
  belongs_to :user
  has_many :filters
end
