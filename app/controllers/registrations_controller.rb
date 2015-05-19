class RegistrationsController < Devise::RegistrationsController
#from Devise

	protected

  #redirect users to new_post_path after signing up for the first time
	def after_sign_up_path_for(resource)
		new_post_path
	end

end