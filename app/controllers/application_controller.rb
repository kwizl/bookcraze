class ApplicationController < ActionController::Base
  include ApplicationHelper

  def user_authenticated
    redirect_to login_path unless session[:name]
  end

  def find_user
    @current_user = User.find_by(name: params[:name])
  end
end
