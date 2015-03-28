class Contact < ActiveRecord::Base

	#---VALIDATIONS------------------------------------------

	#all fields must be present (email done in seperate line)
	validates :name, :subject, :message, presence: true

	#email must be present, and correct type of characters
	#use a regular expression
	validates :email, presence: true,
					  format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


	#-------------------------------------------------------





end
