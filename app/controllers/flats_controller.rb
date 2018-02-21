class FlatsController < ApplicationController
  before_action :set_flats, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def destroy
    @flat.destroy

    redirect_to flats_url
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  def create
     @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end



 private
    # Use callbacks to share common setup or constraints between actions.
    def set_flats
      @flat = Flat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flat_params
      params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
    end

end
