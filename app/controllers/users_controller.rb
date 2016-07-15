class UsersController < ApplicationController

	def show
		@user = User.includes(:registrations,:interviews).find(params[:id])
	end

end