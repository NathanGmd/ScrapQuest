class Item < ApplicationRecord
  belongs_to :feature
  belongs_to :option, optional: true
  belongs_to :prospect
end
