class InterestMailer < ApplicationMailer

  #every time a post is created with a specific tag, this will notify the user who
  #has that interest that a new post was made.
  def notify_interested_users(post)
    @post = post
    @tags = @post.tags
    
    @tags.each do |tag|
      @users = tag.interested_users
      @users.each do |user|
        @user = user
        mail(to: user.email, subject: "Someone created a post with your interests!")
      end
    end
  end

end
