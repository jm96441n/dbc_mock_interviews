FactoryGirl.define do
  factory :user do
    sequence :email do |n|
    	"person#{n}@example.com"
    end
  end
end

FactoryGirl.define do
	factory :user, class: "User" do
		email
		name 'Person McPeopleFace'
		password '123456'
		password_confirmation '123456'
	end
end