class ArticlesController < ApplicationController
  before_action :user_authenticated, only: %i[index new create show]

  def index
    @main_articles = Article.most_voted(article_most_voted)
    @articles = Article.other_voted(article_most_voted)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.image.attach(params[:article][:image])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
