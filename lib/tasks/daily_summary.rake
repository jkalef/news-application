namespace :daily_summary do

  desc "A list with all the comments for that particular 
          users posts for the day day"
  task :daily_summary_of_comments => :environment do

    #select all of the users to iterate over
    @users = User.all
    #iterate over all the users to get their posts
    @users.each do |user|
        #puts user.email
        #puts ""
      @posts = user.posts
      @posts.each do |post|
        #puts post.id
        @comments = post.comments.where("created_at > ?", 1.days.ago)
        #@comments.each do |com|
          #puts com.body
        #end
      end
      DailySummary.notify_user(user, @comments).deliver   
    end
  #close environment iteration
  end

end



