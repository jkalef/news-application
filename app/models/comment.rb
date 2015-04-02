class Comment < ActiveRecord::Base

	#ASSOCIATIONS -------------------------------
	belongs_to :post
	belongs_to :user



	#VALIDATIONS --------------------------------
	validates :body, presence: true




	#CLASS METHODS ------------------------------
	#want to sort the comments by most recent
	def self.most_recent_comments
		Comment.order("created_at DESC")
	end




end
