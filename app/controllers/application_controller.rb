class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

protected
  def after_sign_in_path_for(_resource)
    return products_path if current_user.supplier?
    return projects_path if current_user.architect?
    return admin_root_path if current_user.admin?
    root_path
  end

end
