require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  before(:each) do 
    user = FactoryBot.create(:user)
    @friend = FactoryBot.create(:user, :friend)
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
    get :new, params: { friend_id: @friend.id }
    expect(response).to have_http_status(200)
    end 
    #test for 404 response when no friend_id passed in?
  end 

  describe 'POST/create' do
    it 'adds a friend request' do 
    post :create, params: { friendship: { friend_id: @friend.id} }
    expect(response).to redirect_to friendships_path
    end 
  end 

  describe 'PATCH/update' do 
    it 'accepts friend request' do 
     friendship = FactoryBot.create(:friendship, :confirm_request)
     patch :update, params: { friend_id: @friend.id} 
     expect(response).to redirect_to friendships_path
    end 
  end 

end 