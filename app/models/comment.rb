class Comment < ActiveRecord::Base

	#ASSOCIATIONS -------------------------------
	belongs_to :post
	belongs_to :user

	#VALIDATIONS --------------------------------
	validates :body, presence: true

	#CLASS METHODS ------------------------------
	
  #sort the comments by most recent
	def self.most_recent_comments
		Comment.order("created_at DESC")
	end

	#time checker modal...you only have 15 minutes to edit or delete a comment
  #once it's created
  def time_left(comment) 
    #the maximum time to be able to edit an answer  
    my_time = comment.created_at + 15.minutes

    #the time left (need to convert this to all minutes-left somehow...)
    time_remaining = ((my_time - Time.now)/60).to_i

    if my_time > Time.now 
       time_remaining
    end
  end

  #server side protection from the timeout function on editing
  # #comments...still a work in progress
  # def comment_is_editable
  #   max_time = comment.created_at + 15.minutes
  #   if Time.now > max_time
  #     return false
  #   end
  # end

end
