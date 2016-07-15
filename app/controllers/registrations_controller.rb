class RegistrationsController < ApplicationController

	def index
		@registrations = current_user.registrations
	end

	def new
	end

end