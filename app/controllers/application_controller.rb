class ApplicationController < ActionController::Base
  include ApplicationHelper

  def user_authenticated
    redirect_to login_path unless session[:name]
  end

  def find_user
    @current_user = User.find_by(name: params[:name])
  end

  def category_one
    Category.find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id
      WHERE c.priority = 1 ORDER BY a.created_at DESC LIMIT 1'])
  end

  def category_two
    Category.find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id
      WHERE c.priority = 2 ORDER BY a.created_at DESC LIMIT 1'])
  end

  def category_three
    Category.find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id
      WHERE c.priority = 3 ORDER BY a.created_at DESC LIMIT 1'])
  end

  def category_four
    Category.find_by_sql(['SELECT * FROM articles a JOIN categories c ON a.id = c.article_id
      WHERE c.priority = 4 ORDER BY a.created_at DESC LIMIT 1'])
  end
end
