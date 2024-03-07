require "csv"
class ResearchesController < ApplicationController
  def index
    @researches = Research.all
  end

  def create
    @research = Research.new(user: current_user)
    @research.save!
    redirect_to research_filters_path(@research), notice: "New research successfully created"
  end

  def show
    @research = Research.find(params[:id])
    @prospects = Prospect.all
    
    respond_to do |format|
      format.html
      format.csv { send_prospects_csv(@prospects) }
    end
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
end
