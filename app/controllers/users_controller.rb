class UsersController < ApplicationController

	def show
		@user = User.includes(:upcomings,:interviews).find(params[:id])
	end

end