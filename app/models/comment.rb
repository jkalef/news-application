class Comment < ActiveRecord::Base

	#VALIDATIONS ----------------------------

	#body is required and must be unique per post
	validates :body, presence: true,
	                 uniqueness: true

	#-----------------------------------------



end
