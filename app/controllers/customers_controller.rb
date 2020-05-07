class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to @customer
  end

  def search
    @customers = Customer.where(name: params[:q])
    render :index
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :document, :email)
  end
end
