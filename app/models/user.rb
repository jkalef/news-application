class User < ActiveRecord::Base

  #--ASSOCIATIONS------------------------------------------
  #one to many
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :readings, dependent: :destroy

  #many to many
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



 #--CLASS METHODS-------------------------------------------
 #used to display users name or email when they are logged in
 def show_name
 	if first_name || last_name
 		"#{first_name} #{last_name}".strip.squeeze(" ")
 	else
 		email
 	end
 end        


end
