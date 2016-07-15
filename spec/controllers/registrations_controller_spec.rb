require 'rails_helper'

RSpec.describe UpcomingsController, type: :controller do
	describe 'anonymous user' do
		before :each do
			login_with nil
		end
		it 'New: should redirect to sign in page' do
			get :new
			expect( response ).to redirect_to(new_user_session_path)
		end
	end
	describe 'logged in user' do
		before :each do
			@u = create( :user )
			login_with @u
		end
		it 'New: should show a logged in user the form to make new upcoming interviews' do
			get :new
			expect( response ).to render_template( :new )
		end
	end

end