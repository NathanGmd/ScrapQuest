class FiltersController < ApplicationController
  def index
    @features = Feature.all
    @filter = Filter.new
  end

  def create
    @filter = Filter.new(
      option: Option.find_by(value: filter_params["option"]),
      feature: Feature.find(Option.find_by(value: filter_params["option"]).feature_id)
    )
    if @filter.save!
      redirect_to filters_path, notice: "successfully added!"
    else
      
    end
    raise
  end

  private

  def filter_params
    params.require(:filter).permit(:option)
  end
end
