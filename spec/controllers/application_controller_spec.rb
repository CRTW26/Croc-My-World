require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
    include Devise::Test::ControllerHelpers

    describe "/GET" do
        it "Redirects to login page when not signed in" do
            get :index
            expect(response).to redirect_to new_user_session_path
            expect(response).to have_http_status(302)
        end
        # it "Logging in should take user to posts index" do
        #     user = FactoryBot.create(:user)
        #     sign_in(user)
        #     get :posts
        #     expect(response).to have_http_status(200)
        # end

        # it "Logout should go back to the login" do
        #     user = FactoryBot.create(:user)
        #     sign_in(user)
        #     sign_out(user)
        #     expect(response).to have_http_status(200)
        # end
    end
end