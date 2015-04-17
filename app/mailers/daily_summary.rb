class DailySummary < ApplicationMailer

  def notify_user(user, comments)
    @user = user
    @comments = comments

    #--send the user an email
    mail(to: @user.email, subject: "Someone Commented On Your Post!!")
  end

end


