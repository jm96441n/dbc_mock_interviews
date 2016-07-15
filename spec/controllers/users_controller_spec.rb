require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe 'anonymous user' do
		before :each do
			login_with nil
		end
		it 'Show: should redirect to sign in page' do
			get :show, id: 1
			expect( response ).to redirect_to (new_user_session_path)
		end
	end
	describe 'logged in user' do
		before :each do
			@u = create( :user )
			login_with @u
		end
		it 'Show: should show the user their profile page' do
			get :show, id: @u.id
			expect( response ).to render_template( :show )
		end
	end
end