class Post < ActiveRecord::Base

	#VALIDATIONS --------------------------------------------

	#title is required and must be unique
	validates :title, presence: true,
      	              uniqueness: true

	#body is rquired
	validates :body, presence: true
	
	#--------------------------------------------------------

end
