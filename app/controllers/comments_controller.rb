class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.review_id = params[:review_id]
  	if @comment.save
  	  redirect_to review_path
  	end
  end

  def destroy
  	
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :review_id)
  end

end
