# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = User.new(name: 'Mark Zuckerberg', email: 'mark@facebook.com', password: 'secret')
    expect(user).to be_valid
  end
  it "is not valid without a name" do
    user = User.new(name: '', email: 'mark@facebook.com', password: 'secret')
    expect(user).to_not be_valid
  end
  it "is not valid without an email" do
    user = User.new(name: 'Mark zuckerberg', email: '', password: 'secret')
    expect(user).to_not be_valid
  end
  it "is not valid without an email" do
    user = User.new(name: 'Mark zuckerberg', email: 'mark@facebook.com', password: '')
    expect(user).to_not be_valid
  end
  
  it "has no friends to begin with" do
    user = User.new(name: 'Mark Zuckerberg', email: 'mark@facebook.com', password: 'secret')
    expect(user.friends).to be_empty
  end
 
  it "has a pending friend request" do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user, :friend)
    friendship = FactoryBot.create(:friendship)
    expect(user.pending).to_not be_empty
  end 
end
