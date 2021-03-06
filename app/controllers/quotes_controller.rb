class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  helper_method :slug_param

  def index
    @quotes = Quote.includes(:character).all
  end

  def random
    @quote = Quote.random character
    respond_to do |format|
      format.html { redirect_to quote_path(@quote) }
      format.json { render :show, status: :ok, location: @quote }
    end
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def slug_param
    params[:slug]
  end

  def character
    Character.find_by(slug: slug_param) if slug_param
  end

  def set_quote
    @quote = Quote.includes(:character).find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:text, :character_id)
  end
end
