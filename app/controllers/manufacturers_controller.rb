class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    @manufacturer.save
    redirect_to @manufacturer
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
  
end