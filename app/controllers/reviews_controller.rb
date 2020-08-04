class ReviewsController < ApplicationController
  before_action :authenticate_user!

  ##全体レビュー一覧
  def index
  	@reviews = Review.all
  end

  ##レビュー詳細
  def show
  	@review = Review.find(params[:id])
  	@comments = @review.comments
  	@comment = Comment.new
  end

  ##レビュー編集
  def edit
    @review = Review.find(params[:id])
    @genres = Genre.where(user_id: current_user.id)
  end

  ##新規レビュー投稿
  def new
  	@review = Review.new
  	@genres = Genre.where(user_id: current_user.id)
  end

  ##レビュー作成アクション
  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  	  redirect_to review_path(@review)
  	else
  	  render action: :new
  	end
  end

  ##レビュー更新アクション
  def update
  	@review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render action: :edit
    end
  end

  ##レビュー削除アクション
  def destroy
  	@review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(user_id: current_user.id)
  end

  private
  def review_params
  	params.require(:review).permit(:title, :review_body, :picture, :rating, :genre_id, :user_id, :tag_list)
  end
end
