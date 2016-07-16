class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		@url = 'https://dbc-algorithms.herokuapp.com/' + @user.id
		@login_url = 'https://dbc-algorithms.herokuapp.com'
		mail(to: @user.email,subject: 'Welcome to DBC Algorithms')
	end
end
