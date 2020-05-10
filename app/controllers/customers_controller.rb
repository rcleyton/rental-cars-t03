class CustomersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  
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
    if @customer.save
      flash[:notice] = 'Cliente cadastrado com sucesso'
      redirect_to @customer
    else  
      render :new
    end
  end

  def search
    @customers = Customer.search(params[:q])
    render :index
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :document, :email)
  end
end
