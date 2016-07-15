require 'rails_helper'

RSpec.describe Interview, type: :model do
	before :each do
		@user_1 = create( :user )
		@user_2 = create( :user )
		login_as @user_1
		@interview = create( :interview, user_1: @user_1, user_2: @user_2)
	end
	it 'should have two questions' do
		expect( @interview.question_1 ).to eq("Question 1")
		expect( @interview.question_2 ).to eq("Question 2")
	end
	it 'should have a date' do
		expect( @interview.date ).to eq(Date.tomorrow)
	end
	it 'should have two users' do
		expect( User.find(@interview.user_1_id) ).to eq(User.find(@user_1.id))
		expect( User.find(@interview.user_2_id) ).to eq(User.find(@user_2.id))
	end

end