class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all.order(:slug)
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @character = Quote.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: "#{@character.name} was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: "#{@character.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_character
    @character = Character.find(params[:slug])
  end

  def character_params
    params.require(:character).permit(:name, :slug)
  end
end
