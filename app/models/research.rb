class Research < ApplicationRecord
  belongs_to :user
  has_many :filters
  has_many :options, through: :filters
  has_many :features, through: :filters

  def items_to_prospects
    @list_item = Item.where({ option_id: @research.filters.options_ids })
    Item.where({ option_id: @research.filters.options_ids})
  end

  def with_join_prospect
    @prospects_selected = Prospect.joins(:item).where(item: { option_id: @research.filters.options_ids })
  end
end
