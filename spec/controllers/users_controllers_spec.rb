require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'redirects when not signed in' do
      sign_out(@user)
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'GET /show' do
    it 'responds with 200' do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(200)
    end
  end


end