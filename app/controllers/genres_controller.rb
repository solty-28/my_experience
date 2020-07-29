class GenresController < ApplicationController

#ジャンル一覧
  def index
  	@genres = Genre.where(user_id: current_user.id)
  	@genre = Genre.new
  end

#ジャンル作成
  def create
  	@genres = Genre.where(user_id: current_user.id)
  	@genre = Genre.new(genre_params)
  	@genre.user_id = current_user.id
  	if @genre.save
  	  flash[:notice] = "ジャンルを追加しました"
  	  redirect_to genres_path
  	else
  	  redirect_to genres_path
  	end
  end

  private
  def genre_params
  	params.require(:genre).permit(:genre_name,:user_id)
  end
end
