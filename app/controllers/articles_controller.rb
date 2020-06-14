class ArticlesController < ApplicationController
  before_action :user_authenticated, only: %i[new create edit update show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @article = Article.find_by(params[:id])
  end

  def update
    @article = Article.find_by(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
