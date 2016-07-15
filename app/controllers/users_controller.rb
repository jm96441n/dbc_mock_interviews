class UsersController < ApplicationController

	def show
		@user = User.includes(:upcomings,:interviews).find(current_user.id)
	end

end