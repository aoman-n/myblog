class ArticlesController < ApplicationController
  def index
    @articles = Article.order('id DESC').limit(10)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def destroy
    article = Article.find(params[:id])
    if (current_user.id == article.user_id)
      article.destroy
    end
  end

  def update
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image).merge( user_id: current_user.id)
  end

end
