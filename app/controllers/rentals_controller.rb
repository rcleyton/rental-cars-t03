class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @customers = Customer.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.create(rental_params)
    #@rental.save!
    redirect_to rentals_path
  end 

  def search
    if params[:q].blank?
      @rentals = Rental.all
      flash.now[:alert] = 'Busca não pode ficar em branco'
      render :index
    end 
    @rental = Rental.find_by(code: params[:q].upcase)
    if @rental.blank?
      @rentals = Rental.all
      flash.now[:alert] = "Nenhum resultado encontrado para: #{params[:q]}"
      render :index
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, 
                                   :customer_id, :car_category_id)
  end
end