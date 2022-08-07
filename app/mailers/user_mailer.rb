class UserMailer < ApplicationMailer
    default from: "xxxxx@gmail.com"
    def password_reset(user)
        @user = user
        mail :to => user.email, :subject => "Password Reset"
    end
    def welcome_email
      @user = params[:user]
      @url  = 'http://localhost:3000/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
