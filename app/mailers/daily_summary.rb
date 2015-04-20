class DailySummary < ApplicationMailer

  #this will send users an email with a list of comments created on their posts 
  #within the last day
  #set-up through the rake task
  def notify_user(user, comments)
    @user = user
    @comments = comments

    mail(to: @user.email, subject: "Someone Commented On Your Post!!")
  end

end


