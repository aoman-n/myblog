class ArticlesController < RankingController

  def index
    @articles = Article.order('id DESC').limit(10)
  end

  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:q]}%")
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
    @good_count = @article.goods.count
    @tags = @article.tags
  end

  def new
    @article = Article.new
    @tags = Tag.all
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

  def edit
  end

  def update
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, tag_ids: []).merge( user_id: current_user.id)
  end

end
