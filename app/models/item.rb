class Item < ApplicationRecord
  belongs_to :feature
  belongs_to :option
  belongs_to :prospect
end
