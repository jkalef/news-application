class Admin::BaseController < ApplicationController
  #from Devise
  before_action :authenticate_user!
  before_action :authorize


  private

  def authorize
    #if the user is not an admin, send them to the home page
    redirect_to root_path unless current_user.is_admin?
  end

end
