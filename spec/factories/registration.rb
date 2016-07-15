FactoryGirl.define do
	factory :registration do
		association :user, factory: :user
		date Date.tomorrow
	end
end