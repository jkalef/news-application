class DailySummary < ApplicationMailer

  def notify_user(user, posts)
    @user = user
    @posts = posts

    #--send the user an email
    mail(to: @user.email, subject: "Someone Commented On Your Post!!")
  end

end


