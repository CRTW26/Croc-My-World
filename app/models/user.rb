class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email, :name
  validates :password, presence: true, length: {minimum: 6, maximum: 10}, on: :create
  validates :password, length: {minimum: 6, maximum: 10}, on: :update, allow_blank: true
  has_many :posts
end
