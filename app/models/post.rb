class Post < ActiveRecord::Base

	#---ASSOCIATIONS----------------------------------------
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :reading

	has_many :favorites, dependent: :destroy
	has_many :users_who_favorited, through: :favorites, source: :user


	has_attached_file :picture, :styles => { :medium => "350x350>", :thumb => "100x100>" }
			##url => "/rails_root/public/system/posts/pictures/:id/:style/:basename.:extension"
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

	#search for a specific keyword in the posts
	def self.search(search_term)
		Post.where("title ILIKE ? OR body ILIKE ?", "%#{search_term}%", "%#{search_term}%")
	end


end
