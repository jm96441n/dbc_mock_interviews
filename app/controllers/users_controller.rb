class UsersController < ApplicationController

	def show
		@user = User.includes(:upcomings,:interviews).find(current_user.id)
		UserMailer.test_email(@user).deliver_now
	end

end