class Category < ActiveRecord::Base

	#VALIDATIONS ------------------------------

	#title is required
	validates :title, presence: true

	#------------------------------------------


end
