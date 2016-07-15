class Interview < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	validates :user_1_id, :user_2_id, :date, :question_1, :question_2, presence: true
end