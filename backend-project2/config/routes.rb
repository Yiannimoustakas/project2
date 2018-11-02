Rails.application.routes.draw do

  resources :challenges
  resources :test_pairs
  resources :solutions
  resources :users
end
