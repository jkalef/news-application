class Category < ActiveRecord::Base
  #-DEPRECIATED...using TAGS instead of categories

	#VALIDATIONS ------------------------------

	#title is required
	validates :title, presence: true

	#------------------------------------------


end
