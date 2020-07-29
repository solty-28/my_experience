class ReviewsController < ApplicationController
  def index
  	@reviews = Review.all
  end

  def show
  	@review = Review.find(params[:id])
  	@comments = @review.comments
  	@comment = Comment.new
  end

  def new
  	@review = Review.new
  	@genres = Genre.where(user_id: current_user.id)
  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  	  redirect_to review_path(@review)
  	else
  	  render action: :new
  	end
  end

  def update
  	
  end

  def destroy
  	
  end

  def edit
  end

  private
  def review_params
  	params.require(:review).permit(:title, :review_body, :picture, :rating, :genre_id, :user_id, :tag_list)
  end
end
