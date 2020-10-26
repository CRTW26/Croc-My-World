require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
    include Devise::Test::ControllerHelpers

    describe "/GET" do
        it "Redirects to login page when not signed in" do
            get :index
            expect(response).to redirect_to new_user_session_path
            expect(response).to have_http_status(302)
        end
    end
end