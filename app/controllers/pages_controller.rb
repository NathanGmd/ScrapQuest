class PagesController < ApplicationController
  def home
  end

  def data
    @prospects = Prospect.all
  end

  def search
    @prospects = Prospect.none

    if params[:first_name].present? || params[:last_name].present?
      search_patterns = [params[:first_name], params[:last_name]].reject(&:blank?).map { |word| "%#{word}%" }
      conditions = search_patterns.map { |pattern| "(first_name ILIKE '#{pattern}' OR last_name ILIKE '#{pattern}')" }.join(' AND ')
      
      @prospects = Prospect.where(conditions)
    end
    
    # render turbo_stream: turbo_stream.replace("search_results", partial: "pages/results", locals: { prospects: @prospects })

  end
end
