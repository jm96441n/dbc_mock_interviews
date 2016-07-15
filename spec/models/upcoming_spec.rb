require 'rails_helper'

RSpec.describe Upcoming, type: :model do
	before :each do
		@u = create( :user )
		@reg = create( :upcoming, user_id: @u.id)
	end
	it 'should have a date' do
		expect( @reg.date ).to eq(Date.tomorrow)
	end
	it 'should belong to a user' do
		expect( @reg.user ).to eq( @u )
	end

end