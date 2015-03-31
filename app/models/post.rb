class Post < ActiveRecord::Base

	#VALIDATIONS --------------------------------------------

	#title is required and must be unique
	validates :title, presence: true,
      	              uniqueness: true

	#body is rquired
	validates :body, presence: true
	
	#--------------------------------------------------------


	#CLASS METHODS ------------------------------------------
	#sort the posts by the most recent
	def self.latest
		Post.order("created_at DESC")
	end

	#--------------------------------------------------------

end
