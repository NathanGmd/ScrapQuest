class Filter < ApplicationRecord
  belongs_to :option
  belongs_to :research
  belongs_to :feature

  def self.options_ids
    self.pluck(:option_id).sort
  end

  def self.features_ids
    Filter.all.map { |filter| filter.feature_id }.uniq.sort
  end
end
