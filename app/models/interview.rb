class Interview < ActiveRecord::Base

	has_many :user_interviews
	has_many :users, through: :user_interviews
	validates :date, :question_1, :question_2, presence: true

	# def make_the_interview

	# end

end