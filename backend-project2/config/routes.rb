Rails.application.routes.draw do

  get 'comments/show'
  get 'comments/index'
  get 'comments/update'
  get 'comments/edit'
  get 'comments/new'
  get 'comments/create'
  get 'session/new'

  get 'session/create'
  get 'session/destroy'

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  resources :challenges
  resources :test_pairs
  resources :solutions
  resources :users
end
