class CategoriesController < ApplicationController
  before_action :user_authenticated, only: %i[show]

  def show
    category = Category.find(params[:id])
    @category_articles = Category.category_articles(category.id)
  end
end
