class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end

  def edit
    @article = Article.find_by(params[:id])
  end

  def update
    @article = Article.find_by(params[:id])
  end

  def show
    @article = Article.find_by(params[:id])
  end
end
