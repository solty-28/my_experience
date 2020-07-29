class UserController < ApplicationController
  def index
  	
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@reviews = Review.where(user_id: current_user.id)
  end
end
