class UserMailer < ApplicationMailer
	default from: 'john@johnmaguiredeveloper.com'

	def welcome_email(user)
		@user = user
		@url = 'https://dbc-algorithms.herokuapp.com/' + @user.id
		@login_url = 'https://dbc-algorithms.herokuapp.com'
		mail(to: @user.email,subject: 'Welcome to DBC Algorithms')
	end

	def interview_email(user, partner, question)
		@user = User.find(user)
		@partner = partner
		@question = question
		@url = "https://dbc-algorithms.herokuapp.com/#{@user.id}"
		mail(to: @user.email,subject: 'Your Upcoming Mock Interview')
		mail(to: 'john@johnmaguiredeveloper.com',subject: 'Your Upcoming Mock Interview')
	end	

	def interview_3_email(user, partner1, partner2, question)
		@user = User.find(user)
		@partner1 = partner1
		@partner2 = partner2
		@question = question
		@url = 'https://dbc-algorithms.herokuapp.com/' + @user.id
		mail(to: @user.email,subject: 'Your Upcoming Mock Interview')
	end

	def test_email(user)
		@user = user
		mail(to: @user.email,subject: 'It Works!')
	end

	def start_email(user)
		@user = user
		mail(to: @user.email,subject: "Let's Get Started!")
	end

	def check_in(user)
		@user = user
		mail(to: @user.email,subject: 'Checking In')
	end

	def confirm(user)
		@user = user
		mail(to: @user.email, subject 'Confirming Your Session for Tomorrow')
	end
end
