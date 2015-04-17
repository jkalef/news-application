class Tag < ActiveRecord::Base

    #--ASSOCIATIONS----------------------------------
    has_many :tagizations, dependent: :nullify
    has_many :posts, through: :tagizations

    #--VALIDATIONS-----------------------------------
    #only one tag of the same name can exist
    # validates :name, uniqueness: true


    #--CLASS METHODS---------------------------------
    #I want to accept a string from the user, and convert that
    #string into a bunch of new tags....should I do this here or
    #in the controller???
    

end
