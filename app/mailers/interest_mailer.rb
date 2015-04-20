class InterestMailer < ApplicationMailer

  #every time a post is created with a specific tag, I want to notify the user who
  #has that interest that a new post was made.
  def notify_interested_users(post)
    @post = post
    @post.tags = @tags
    
    @tags.each do |tag|
      @users = tag.interested_users
      @users.each do |user|
        user = @send_to_user
        mail(to: @send_to_user.email, subject: "Someone created a post with your interests!")
      end
    end

end
