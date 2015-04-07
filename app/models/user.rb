class User < ActiveRecord::Base

  #--ASSOCIATIONS------------------------------------------
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :readings, dependent: :destroy

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
