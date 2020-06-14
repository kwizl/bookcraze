class UsersController < ApplicationController
  before_action :user_authenticated, only: %i[index]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:name] = params[:name]
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def user_authenticated
    redirect_to login_path unless session[:name]
  end
end
