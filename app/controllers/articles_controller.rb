class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image).merge( user_id: current_user.id)
  end

end
