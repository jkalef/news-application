class Tag < ActiveRecord::Base

    #--ASSOCIATIONS----------------------------------
    has_many :tagizations, dependent: :nullify
    has_many :posts, through: :tagizations

    has_many :interests, dependent: :destroy
    has_many :interested_users, through: :interests, source: :user

    #--VALIDATIONS-----------------------------------
    #only one tag of the same name can exist
    # validates :name, uniqueness: true


    #--CLASS METHODS---------------------------------
    #only display unique tags when selecting them when you
    #setup your account
    def self.unique_tags
        Tag.select(:name, :id).distinct(:name)
    end


  #show related posts on each page (limit it to 1 per tag per page)
  #random post will be selected for each tag
  #for some reason the method doesn't seem to work....
  # def related_posts
  #     Tag.posts.sample
  # end


    #make sure tags are not duplicates when they are created
    def self.find_by_name_or_new(name)
        t = Tag.find_by_name(name)
        t || Tag.new(name: name)
    end
    
end
