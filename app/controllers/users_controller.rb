class UsersController < ApplicationController

	def show
		@user = User.includes(:upcomings,:interviews).find(current_user.id)
	end

	def create!
		welcome_message
		super
	end

	private

	def welcome_message
		UserMailer.welcome_email(self).deliver
	end

end