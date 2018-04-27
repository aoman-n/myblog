class GoodsController < ApplicationController
  def create
    Good.create(user_id: current_user.id, article_id: params[:article_id])
    @article = Article.find(params[:article_id])
    @good_count = @article.goods.count
    respond_to do |format|
      format.html
      format.json
    end
  end

end
