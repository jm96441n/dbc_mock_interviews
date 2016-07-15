FactoryGirl.define do
	factory :upcoming do
		association :user, factory: :user
		date Date.tomorrow
	end
end