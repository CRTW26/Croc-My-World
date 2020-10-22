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

    it 'responds with an ok' do
      user = User.create email: 'email@email.com', password: 'password', name: 'name'
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(200)
    end

    # it 'redirects to an edit page' do

    #   get :edit
    #   expect(response).to redirect_to(user_url)
    # end
  end

  describe 'POST' do
    it 'redirects to posts pages' do
      post :create, params: { user: {email: 'user@user.com', password: '12345', name: 'John Smith' } }
      expect(response).to be_redirect
    end
  end


   
  

end



