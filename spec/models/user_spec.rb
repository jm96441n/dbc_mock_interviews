require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
  	@u = create( :user )
  end
  it 'should have an email' do
  	expect( User.last.email ).to match(/^person\d+@example.com/)
  end
  it 'should have a name' do
  	expect( User.first.name ).to eq('Person McPeopleFace')
  end
  it 'should have many registrations' do
  	registrations = @u.registrations
  	expect( registrations ).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
  end
  it 'should have many interviews' do
  	interviews = @u.interviews
  	expect( interviews ).to be_kind_of(ActiveRecord::Associations::CollectionProxy)
  end
end	
