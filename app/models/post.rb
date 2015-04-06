class Post < ActiveRecord::Base

	#---ASSOCIATIONS----------------------------------------
	has_many :comments, dependent: :destroy
	belongs_to :user


	#VALIDATIONS --------------------------------------------
	#title is required and must be unique
	validates :title, presence: true,
      	              uniqueness: true

	#body is rquired
	validates :body, presence: true
	

	#CLASS METHODS ------------------------------------------
	#sort the posts by the most recent
	def self.latest
		Post.order("created_at DESC")
	end

	#search for a specific keyword in the posts
	def self.search(search_term)
		Post.where("title ILIKE ? OR body ILIKE ?", "%#{search_term}%", "%#{search_term}%")
	end


end
