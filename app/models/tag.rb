class Tag < ActiveRecord::Base

    #--ASSOCIATIONS----------------------------------
    has_many :tagizations, dependent: :nullify
    has_many :posts, through: :tagizations

    has_many :interests, dependent: :destroy
    has_many :users, through: :interests, source: :user

    #--VALIDATIONS-----------------------------------
    #only one tag of the same name can exist
    # validates :name, uniqueness: true


    #--CLASS METHODS---------------------------------
    #only display unique tags when sorting by tags
    def self.unique_tags
        Tag.select(:name, :id).distinct(:name)
    end
    

    def self.find_by_name_or_new(name)
        t = Tag.find_by_name(name)
        t || Tag.new(name: name)
    end
    
end
