class UpcomingsController < ApplicationController

	def index
		@upcomings = current_user.upcomings
	end

	def new
	end

end