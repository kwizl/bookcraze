class CategoriesController < ApplicationController
  before_action :user_authenticated, only: %i[show]

  def show
    category = Category.find(params[:id])
    @categories = Article.category_article(category.name)
  end
end
