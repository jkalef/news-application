class Tag < ActiveRecord::Base

    #--ASSOCIATIONS----------------------------------
    has_many :tagizations, dependent: :nullify
    has_many :posts, through: :tagizations

    #--VALIDATIONS-----------------------------------
    #only one tag of the same name can exist
    # validates :name, uniqueness: true


    #--CLASS METHODS---------------------------------
    #only display unique tags when sorting by tags
    def self.unique_tags
        Tag.select(:name).distinct
    end
    
end
