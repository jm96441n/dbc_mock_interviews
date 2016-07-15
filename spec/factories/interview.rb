FactoryGirl.define do
	factory :interview do
		association :user_1_id, factory: :user
		association :user_2_id, factory: :user
		question_1 "Question 1"
		question_2 "Question 2"
		date Date.tomorrow
	end
end