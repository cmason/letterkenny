class Quotes::RandomController < ApplicationController
  def index
    @quote = Quote.random
    respond_to do |format|
      format.html { redirect_to quote_path(@quote) }
      format.json { render "quotes/show", status: :ok, location: @quote }
    end
  end

  def show
    @quote = Quote.random character
    respond_to do |format|
      format.html { redirect_to quote_path(@quote) }
      format.json { render "quotes/show", status: :ok, location: @quote }
    end
  end

  private

  def slug_param
    params[:slug]
  end

  def character
    Character.find_by!(slug: slug_param) # if slug_param
  end
end
