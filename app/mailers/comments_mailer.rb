class CommentsMailer < ApplicationMailer

  #---SEND AUTHOR AN EMAIL WHEN SOMEONE COMMMENTS ON THE POST ----------------
  def notify_post_owner(comment)
    #--these variables will be used in the mailer
    @comment = comment
    @post    = comment.post
    @user    = @post.user

    #--send the user an email
    mail(to: @user.email, subject: "Someone Commented On Your Post!!")
  end

end
