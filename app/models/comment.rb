class Comment < ActiveRecord::Base

	#ASSOCIATIONS -------------------------------
	belongs_to :post
	belongs_to :user



	#VALIDATIONS --------------------------------
	validates :body, presence: true




	#CLASS METHODS ------------------------------
	#want to sort the comments by most recent
	def self.most_recent_comments
		Comment.order("created_at DESC")
	end

	# time checker modal
  def time_left(comment) 
    #the maximum time to be able to edit an answer  
    my_time = comment.created_at + 15.minutes

    #the time left (need to convert this to all minutes-left somehow...)
    time_remaining = ((my_time - Time.now)/60).to_i

    if my_time > Time.now 
       time_remaining
    end
  end




end
