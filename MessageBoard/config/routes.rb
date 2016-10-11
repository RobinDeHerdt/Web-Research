Rails.application.routes.draw do
  devise_for :users
  resources :messages do
  	resources :comments
  end
  # generates standard routes for messages (create, new, edit, show, update, destroy)
  root 'messages#index'
end
