class Comment < ActiveRecord::Base

	#VALIDATIONS ----------------------------

	#body is required and must be unique per post
	validates :body, presence: true,
	                 uniqueness: true

	#-----------------------------------------


	#CLASS METHODS ----------------------------

	#want to sort the comments by most recent
	def self.most_recent_comments
		Comment.order("created_at DESC")
	end

	#-------------------------------------------


end
