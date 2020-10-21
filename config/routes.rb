# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controller => {:registrations => 'users'}
  post'/users/create', to: 'posts#index'
  resources :posts
  resources :users
end
