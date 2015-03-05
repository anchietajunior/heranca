class FisicasController < ApplicationController
  before_action :find_fisica, only: [:show, :edit, :update, :destroy]

  def index
    @users = Fisica.all
  end

  def show
  end

  def new
    @user = Fisica.new
  end

  def create
    @user = Fisica.new(fisica_params)
  
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  
  end

  def edit
  end

  def update
    if @user.update(fisica_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to fisicas_path
  end

  private 

  def find_fisica
    @user = Fisica.find(params[:id])
  end

  def fisica_params
    params.require(:fisica).permit(:name, :email, :type)
  end
  
end
