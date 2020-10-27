require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  before(:each) do 
    user = FactoryBot.create(:user)
    sign_in(user)
  end 

  describe 'GET/' do 
    it 'returns page with all friends' do 
      get :index 
      expect(response).to have_http_status(200)
    end 
  end 

  describe 'GET/new' do 
    it 'returns page to add friend' do 
    get :new 
    expect(response).to have_http_status(200)
    end 
  end 

end 