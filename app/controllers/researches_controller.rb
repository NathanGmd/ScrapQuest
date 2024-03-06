class ResearchesController < ApplicationController
  def index
    @researches = Research.all
  end
end
