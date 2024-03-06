class FiltersController < ApplicationController
  def index
    @research = Research.find(params[:research_id])
    @filters = Filter.where(research_id: @research.id)
    @features = Feature.all
    @filter = Filter.new
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
