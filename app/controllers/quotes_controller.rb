class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit]

  def index
    character.quotes
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  # def create
  #   @quote = Quote.new(quote_params)

  #   respond_to do |format|
  #     if @quote.save
  #       format.html { redirect_to @quote, notice: "Quote was successfully created." }
  #       format.json { render :show, status: :created, location: @quote }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @quote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @quote.update(quote_params)
  #       format.html { redirect_to @quote, notice: "Quote was successfully updated." }
  #       format.json { render :show, status: :ok, location: @quote }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @quote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @quote.destroy
  #   respond_to do |format|
  #     format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def character
    @character ||= Character.find(params[:character_slug])
  end

  def set_quote
    @quote = Quote.includes(:character).find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:text, :character_id)
  end
end
