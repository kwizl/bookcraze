class SessionsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      if find_user
        session[:name] = params[:name]
        session[:id] = @current_user.id
  
        format.html { redirect_to articles_path, notice: 'Logged in successfully.' }
      else
        format.html { render action: :new }
      end
    end
  end

  def destroy
    session.delete(:name)
    session.delete(:id)
    redirect_to login_path, notice: 'Logged out!'
  end
end
