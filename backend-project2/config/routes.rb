Rails.application.routes.draw do
  root 'challenges#index'
  resources :challenges
  resources :test_pairs
  resources :solutions
  resources :users
end
