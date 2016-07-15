class InterviewsController < ApplicationController

	def show
		@interview = Interview.find(params[:id])
		@users = @interview.users
		if @users.length == 3
			@user_questions = {
				@users[0] => @interview.question_1,
				@users[1] => @interview.question_2,
				@users[2] => @interview.question_3
			}
		else
			@user_questions = {
				@users[0] => @interview.question_1,
				@users[1] => @interview.question_2
			}
		end
	end
end

