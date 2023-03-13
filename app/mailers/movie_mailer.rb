class MovieMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://example.com/login'
    main(to: @user.email, subject: 'Welcome to our website')
  end
end
