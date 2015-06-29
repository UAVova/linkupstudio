class UserMailer < ApplicationMailer
  default from: 'uavova@ukr.net'
 
  def comment_notification(user, task)
    @user = user
    @task  = task
    mail(to: @user.email, subject: 'Your ticket was answered by admin')
  end
end
