Rails.application.routes.draw do
  resource :messages
  # generates standard routes for messages (create, new, edit, show, update, destroy)
  root 'messages#index'
end
