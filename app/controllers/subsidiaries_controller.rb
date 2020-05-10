class SubsidiariesController  < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  
  def index
    @subsidiaries = Subsidiary.all
  end

  def show
    @subsidiary = Subsidiary.find(params[:id])
  end

  def new
    @subsidiary = Subsidiary.new
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    if @subsidiary.save
      flash[:notice] = 'Filial criada com sucesso'
      redirect_to @subsidiary
    else  
      render :new
    end
  end

  def edit
    @subsidiary = Subsidiary.find(params[:id])
  end

  def update
    @subsidiary = Subsidiary.find(params[:id])
    if @subsidiary.update(subsidiary_params)
      redirect_to @subsidiary
    else  
      render :edit
    end
  end

  private
  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj, :adress)
  end

end