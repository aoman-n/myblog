class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to controller: :articles, action: :index
  end

  def edit

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, article_id: params[:article_id])
  end

end
