class CommentsController < ApplicationController

  ## レビューへのコメント投稿アクション
  def create
    @review = Review.find(params[:review_id])
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.review_id = params[:review_id]
  	if @comment.save
  	  redirect_to review_path(@review)
  	end
  end

  ## コメント削除アクション
  def destroy
  	@review = Review.find(params[:review_id])
    @comment = Comment.find_by(user_id: current_user.id, review_id: params[:review_id])
    if @comment.destroy
      redirect_to review_path(@review)
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :review_id)
  end

end
