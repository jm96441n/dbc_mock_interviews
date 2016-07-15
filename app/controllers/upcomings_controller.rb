class UpcomingsController < ApplicationController

	def new
		@upcoming = Upcoming.new
	end

	def create
		upcoming_params.each do |label,date|
			@upcoming = Upcoming.new(date: date, user_id: current_user.id)
			@upcoming.save
		end
		redirect_to action: "show", controller: "users", id: current_user.id
	end


	private

	def upcoming_params
		params[:upcoming].permit('1_tuesday', '1_thursday', '2_tuesday', '2_thursday')
	end	
end