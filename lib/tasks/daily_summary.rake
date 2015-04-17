namespace :daily_summary do

  desc "A list with all the comments for that particular 
          users posts for the day day "
  task :daily_summary_of_comments => :environment do

    #select all of the users to iterate over
    @users = User.all
    #iterate over all the users to get their posts
    @users.each do |user|
      @posts = user.posts
      DailySummary.notify_user(user, @posts).deliver
      #iterate over all the posts to get the recent comments
      user.posts.each do |post|
         @comments = post.comments.where("created_at > ?", 1.days.ago) 
         @comments.each do |comment|
          #close commments iteration
          end
      #close post iteration
      end
 
   #close user iteration   
   end     
  #close environment iteration
  end
end



