class InterviewsController < ApplicationController

	def show
		@interview = Interview.find(params[:id])
		@p_1 = User.find(@interview.user_1_id)
		@p_2 = User.find(@interview.user_2_id)
		@p_3 = User.find(@interview.user_3_id)
		if @interview.user_1_id == current_user.id
			@question = @interview.question_1
			@partner_1 = @p_2
			@partner_2 = @p_3
		elsif @interview.user_2_id == current_user.id
			@question = @interview.question_2
			@partner_1 = @p_1
			@partner_2 = @p_3
		else
			@question = @interview.question_3
			@partner_1 = @p_1
			@partner_2 = @p_2
		end

	end
end

