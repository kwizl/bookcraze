module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def article_most_voted
    hash = Vote.group('article_id').count
    return hash.invert.max&.last
  end
end
