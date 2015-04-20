class Post < ActiveRecord::Base
	#allow accessing this data through the post creation form
	attr_accessor :tag_string

	#---ASSOCIATIONS----------------------------------------
	has_many :comments, dependent: :destroy
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :users_who_favorited, through: :favorites, source: :user

	has_many :tagizations, dependent: :nullify
	has_many :tags, through: :tagizations

	#from paperclip
	#can allow other sizes if wanted later on
	has_attached_file :picture, :styles => { :medium => "350x350>" }, 
																:default_url => "/assets/images/my_pic.jpeg"
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/	

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

	#for the menu to display featured posts (will just display them randomly each time
	#page is loaded)
	def self.featured_posts
		#use the RANDOM() method from postgres
		Post.order("RANDOM()").limit 10
	end

	#search for a specific keyword in the posts
	def self.search(search_term)
		Post.where("title ILIKE ? OR body ILIKE ?", "%#{search_term}%", "%#{search_term}%")
	end

	#lucky search will only return one post
	def self.lucky_search(search_term)
		Post.where("title ILIKE ? OR body ILIKE ?", "%#{search_term}%", "%#{search_term}%").sample
	end

end
