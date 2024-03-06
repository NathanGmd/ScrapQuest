class FiltersController < ApplicationController
  def index
    @filter = Filter.new
    @research = Research.find(params[:research_id])
    @filters = Filter.where(research_id: @research)
    @features = Feature.all
    @grouped_options = @research.options.group_by(&:feature_id)
    @grouped_options = @grouped_options.transform_keys! { |key| Feature.find(key) }
  end

  def create
    @research = Research.find(params[:research_id])
    @filter = Filter.new(
      option: Option.find_by(value: filter_params["option"]),
      feature: Feature.find(Option.find_by(value: filter_params["option"]).feature_id),
      research: Research.find(params[:research_id])
    )
    @filter.save!
    redirect_to research_filters_path(@research), notice: "successfully added!"
  end

  private

  def filter_params
    params.require(:filter).permit(:option)
  end
end
