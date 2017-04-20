class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   if current_user.is_admin
  #     redirect_to admin_matches_path, notice: 'Welcome.'
  #   else
  #     redirect_to "/"
  #   end
  # end
end
