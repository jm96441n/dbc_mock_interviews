class ConfirmationsController < Devise::ConfirmationsController
	skip_before_action
	def new
		super
	end

end