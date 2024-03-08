require "csv"
class ResearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @researches = current_user.researches
    @researches_grouped = @researches.map do |research|
      grouped_options = research.options.group_by(&:feature_id)
      grouped_options = grouped_options.transform_keys! { |key| Feature.find(key) }
      {
        research: research,
        grouped_options: grouped_options
      }
    end
  end

  def create
    @research = Research.new(user: current_user)
    @research.save!
    redirect_to research_filters_path(@research), notice: "New research successfully created"
  end

  def show
    @research = current_user.researches.find(params[:id])
    @prospects = Prospect.all
    grouped_options = @research.options.group_by(&:feature_id)
    grouped_options = grouped_options.transform_keys! { |key| Feature.find(key) }
    option_ids = @research.option_ids
    @prospect_list = Prospect.joins(:items)
                             .where(items: { option_id: option_ids })
                             .group("prospects.id")
                             .having('COUNT(DISTINCT items.feature_id) = ?', @research.features.uniq.size)
    @prospects = @prospect_list
    respond_to do |format|
      format.html
      format.csv { send_prospects_csv(@prospects) }
    end
  end

  def edit
    @research = current_user.researches.find(params[:id])
    option_ids = @research.option_ids
    @prospect_list = Prospect.joins(:items)
                             .where(items: { option_id: option_ids })
                             .group("prospects.id")
                             .having('COUNT(DISTINCT items.feature_id) = ?', @research.features.uniq.size)
    @prospect_size = @prospect_list.size
  end

  def update
    set_research
    @user = current_user
    @research.update(prospect_params)
    redirect_to research_path(@research)
  end

  private

  def send_prospects_csv(prospects)
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["\xEF\xBB\xBF" + "first name:", "\xEF\xBB\xBF" + "Last name:", "\xEF\xBB\xBF" + "Address:", "\xEF\xBB\xBF" + "Email:"]
      prospects.each do |prospect|
        csv << [prospect.first_name, prospect.last_name, prospect.address, prospect.email]
      end
    end

    send_data csv_data, filename: "prospects-#{Date.today}.csv"
  end

  def set_research
    @research = Research.find(params[:id])
  end

  def prospect_params
    params.require(:research).permit(:prospect_count)
  end
end
