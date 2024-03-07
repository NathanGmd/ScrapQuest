class FiltersController < ApplicationController
  before_action :set_research, only: %i[index toggle]

  def index
    @filter = Filter.new
    @filters = Filter.where(research_id: @research)
    @features = Feature.all
    set_display
  end

  def toggle
    if @research.option_ids.include?(Option.find_by(value: params[:filter][:option]).id)
      destroy
    else
      create
    end
  end


  private

  def create
    @filter = Filter.new(
      option: Option.find_by(value: filter_params["option"]),
      feature: Feature.find(Option.find_by(value: filter_params["option"]).feature_id),
      research: Research.find(params[:research_id])
    )
    @filter.save!
    set_display
    respond_to do |format|
      format.html
      format.text { render partial: 'filters/filters_content', locals: { research: @research, grouped_options: @grouped_options }, formats: [:html] }
    end
  end

  def destroy
    @option = Option.find_by(value: params[:filter][:option])
    @filter = @research.filters.find_by(option: @option)
    @filter.destroy
    set_display
    respond_to do |format|
      format.html
      format.text { render partial: 'filters/filters_content', locals: { research: @research, grouped_options: @grouped_options }, formats: [:html] }
    end
  end

  def filter_params
    params.require(:filter).permit(:option)
  end

  def set_research
    @research = Research.find(params[:research_id])
  end

  def set_display
    @grouped_options = @research.options.group_by(&:feature_id)
    @grouped_options = @grouped_options.transform_keys! { |key| Feature.find(key) }
  end
end
