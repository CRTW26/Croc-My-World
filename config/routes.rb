# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  #devise_for :users, :controllers => {:registrations => "users"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match 'users/new/:id', to: 'posts#index'
  resources :posts
  resources :users
end
