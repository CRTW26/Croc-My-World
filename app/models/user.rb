# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :name
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  def friends
    friends_array = friendships.map{ |friendship| friendship.friend if friendship.confirmed }
    friends_array + inverse_friendships.map{ |friendship| friendship.user if friendship.confirmed}
    friends_array.compact
  end

  def pending 
    friendships.map{ |friendship| friendship.friend if !friendship.confirmed }.compact
  end 

  def requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.confirmed }.compact
  end 

  def confirm(user) 
    friendship = inverse_friendships.find { |friendship| friendship.user == user }
    friendship.confirmed = true
    friendship.save 
  end 

end
