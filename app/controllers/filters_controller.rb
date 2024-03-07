class FiltersController < ApplicationController
  before_action :set_research, only: %i[index create]

  def index
    @filter = Filter.new
    @filters = Filter.where(research_id: @research)
    @features = Feature.all
    @grouped_options = @research.options.group_by(&:feature_id)
    @grouped_options = @grouped_options.transform_keys! { |key| Feature.find(key) }
  end

  def create
    @filter = Filter.new(
      option: Option.find_by(value: filter_params["option"]),
      feature: Feature.find(Option.find_by(value: filter_params["option"]).feature_id),
      research: Research.find(params[:research_id])
    )
    @filter.save!
    @grouped_options = @research.options.group_by(&:feature_id)
    @grouped_options = @grouped_options.transform_keys! { |key| Feature.find(key) }
    respond_to do |format|
      format.html
      format.text { render partial: 'filters/filters_content', locals: { research: @research, grouped_options: @grouped_options }, formats: [:html] }
    end
  end

  def delete
    
  end

  private

  def filter_params
    params.require(:filter).permit(:option)
  end

  def set_research
    @research = Research.find(params[:research_id])
  end
end
