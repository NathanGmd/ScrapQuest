class ResearchesController < ApplicationController
  def index
    @items = Item.all
    @items = Item.includes(:feature)
  end
end
