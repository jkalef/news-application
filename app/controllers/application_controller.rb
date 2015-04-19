class ApplicationController < ActionController::Base

#def after_sign_up_path_for(resource)
 #   request.env['omniauth.origin'] || stored_location_for(resource) || new_post_path
 # end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  #this will redirect admins to the user page when they sign up
  def after_sign_in_path_for(resource)
    if resource.is_admin?
      admin_users_path
    else    
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end


  private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, {tag_ids: []}]
  	devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, {tag_ids: []}]
  end


end
