class QuotesController < ApplicationController
  def show
    @quote = Quote.includes(:character).find(params[:id])
  end
end
