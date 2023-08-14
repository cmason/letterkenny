class Quotes::RandomController < ApplicationController
  def index
    @quote = Quote.random
    render_quote
  end

  def show
    @quote = Quote.random character
    render_quote
  end

  private

  def render_quote
    respond_to do |format|
      format.html { render "quotes/show", status: :ok }
      format.json { render "quotes/show", status: :ok, location: @quote }
    end
  end

  def slug_param
    params[:slug]
  end

  def character
    Character.find_by!(slug: slug_param)
  end
end
