class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  protected
  def after_sign_in_path_for(user)
  	project_test_path
  end

end
