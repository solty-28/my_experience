class ApplicationController < ActionController::Base

# サインイン、サインアウト後のパス指定
  def after_sign_up_path_for(resource)
  	user_path(resource)
  end

  def after_sign_in_path_for(resource)
  	user_path(resource)
  end

  def after_sign_out_path_for(resource)
  	root_path
  end

end
