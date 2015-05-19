class User < ActiveRecord::Base

  #--ASSOCIATIONS------------------------------------------
  #one to many
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  #many to many
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :interests, dependent: :destroy
  has_many :tags, through: :interests, source: :tag

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #--CALLBACKS-------------------------------------------------
  #when a new user signs up, set their default status to is_admin: false
  after_initialize :set_defaults


 #--CLASS METHODS-------------------------------------------
 #used to display users first name or email when they are logged in
 def show_name
 	if first_name
 		"#{first_name}".strip.squeeze(" ")
 	else
 		email
 	end
 end        

  #for the callback above
  def set_defaults
    self.is_admin == false
  end

end
