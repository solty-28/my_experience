class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  	
  end


  ## マイページ表示
  def show
  	@user = User.find_by(id: params[:id])
  	@reviews = Review.where(user_id: current_user.id)
  end
end
