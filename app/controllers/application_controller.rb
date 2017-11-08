class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home  
  end

  protected
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || login_path
  end
end
