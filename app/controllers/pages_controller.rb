class PagesController < ApplicationController
  def home
  end

  def data
    @prospects = []
  end

  def search
    @prospects = Prospect.none

    if params[:first_name].present? || params[:last_name].present?
      search_patterns = [params[:first_name], params[:last_name]].reject(&:blank?).map { |word| "%#{word}%" }
      conditions = search_patterns.map { |pattern| "(first_name ILIKE '#{pattern}' OR last_name ILIKE '#{pattern}')" }.join(' AND ')
      
      @prospects = Prospect.where(conditions)
    end
    
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pages/results", locals: {prospects: @prospects}, formats: [:html] }
    end
    # render turbo_stream: turbo_stream.replace("search_results", partial: "pages/results", locals: { prospects: @prospects })

  end
end
