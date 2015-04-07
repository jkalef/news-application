class Reading < ActiveRecord::Base

	#--ASSOCIATIONS-------------------------
	has_many :posts, dependent: :nullify
	belongs_to :user


	#--VALIDATIONS---------------------------
	validates :name, presence: true

end
