require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /' do
    it 'defaults to a login/sign up index' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'responds with an ok' do
      get :new 
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST' do
    it 'redirects to posts pages' do
      post :create, params: { user: {email: 'user@user.com', password: '12345', name: 'John Smith' } }
      expect(response).to be_redirect
    end
  end
    # it 'creates a new user'

  # describe 'POST /' do
  #   it 'can add a new user' do
  #     post :new 

  

end

# it can create new users

