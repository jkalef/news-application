class Tag < ActiveRecord::Base

    #--ASSOCIATIONS----------------------------------
    has_many :tagizations, dependent: :nullify
    has_many :posts, through: :tagizations

    has_many :interests, dependent: :destroy
    has_many :interested_users, through: :interests, source: :user


    #--CLASS METHODS---------------------------------
    #only display unique tags when selecting them when you
    #setup your account
    def self.unique_tags
        Tag.select(:name, :id).distinct(:name)
    end

    #make sure tags are not duplicates when they are created
    #use this method in the posts controller when creating a new post
    def self.find_by_name_or_new(name)
        t = Tag.find_by_name(name)
        t || Tag.new(name: name)
    end
    
end
