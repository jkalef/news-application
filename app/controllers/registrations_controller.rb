class RegistrationsController < Devise::RegistrationsController

	protected


	def after_sign_up_path_for(resource)
		"/posts/new"
	end

	def after_inactive_sign_up_path_for(resource)	
		"/posts/new"
	end

end