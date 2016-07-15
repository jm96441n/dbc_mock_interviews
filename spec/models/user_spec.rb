require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
  	@u = create( :user )
  end
  it 'should have an email' do
  	expect( User.first.email ).to eq('person1@example.com')
  end
  it 'should have a name' do
  	expect( User.first.name ).to eq('Person McPeopleFace')
  end
  
end
