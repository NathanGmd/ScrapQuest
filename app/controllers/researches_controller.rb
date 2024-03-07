class ResearchesController < ApplicationController
  def index
    @researches = Research.all
  end

  def create
    @research = Research.new(user: current_user)
    @research.save!
    redirect_to research_filters_path(@research), notice: "New research successfully created"
  end

  def edit
    @research = Research.find(params[:id])
  end
end
