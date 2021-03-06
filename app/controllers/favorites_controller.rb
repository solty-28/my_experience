class FavoritesController < ApplicationController
  before_action :authenticate_user!

  ##いいねレビュー一覧
  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  ##いいね作成
  def create
  	@review = Review.find(params[:review_id])
  	@favorite = Favorite.new(user_id: current_user.id, review_id: @review.id)
  	@favorite.save
  	redirect_to review_path(@review)
  end

  ##いいね削除
  def destroy
  	@review = Review.find(params[:review_id])
  	@favorite = Favorite.find_by(user_id: current_user.id, review_id: @review.id)
    @favorite.destroy
    redirect_to review_path(@review)
  end
end
