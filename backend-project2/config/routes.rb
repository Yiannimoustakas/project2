Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'show/index'
  get 'show/edit'
  get 'show/update'
  get 'show/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
