class JuridicasController < ApplicationController
  before_action :find_juridica, only: [:show, :edit, :update, :destroy]

  def index
    @users = Juridica.all
  end

  def show
  end

  def new
    @user = Juridica.new
  end

  def create
    @user = Juridica.new(juridica_params)
  
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  
  end

  def edit
  end

  def update
    if @user.update(juridica_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to juridicas_path
  end

  private 

  def find_juridica
    @user = Juridica.find(params[:id])
  end

  def juridica_params
    params.require(:juridica).permit(:name, :email, :type)
  end
end
