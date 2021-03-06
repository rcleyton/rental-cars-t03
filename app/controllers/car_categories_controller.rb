class CarCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  
  def index
    @car_categories = CarCategory.all
  end

  def show
    @car_category = CarCategory.find(params[:id])
    @car_models = CarModel.where(car_category: @car_category)
  end

  def new
    @car_category = CarCategory.new
  end

  def create 
    @car_category = CarCategory.new(car_category_params)
    @car_category.save
    redirect_to @car_category
  end

  def edit
    @car_category = CarCategory.find(params[:id])
  end

  def update
    @car_category = CarCategory.find(params[:id])
    if @car_category.update(car_category_params)
      redirect_to @car_category
    else 
      render :edit
    end
  end

  private
  def car_category_params
    params.require(:car_category).permit(:name, :daily_rate, :car_insurance, 
                   :third_part_insurance)
  end
end