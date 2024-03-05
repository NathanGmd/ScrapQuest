class Filter < ApplicationRecord
  belongs_to :option
  belongs_to :research
  belongs_to :feature
end
