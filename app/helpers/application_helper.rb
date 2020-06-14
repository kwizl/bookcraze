module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def user_authenticated
    redirect_to login_path unless session[:name]
  end

  def find_user
    @current_user = User.find_by(name: params[:name])
  end
end
