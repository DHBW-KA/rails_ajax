Rails.application.routes.draw do
  resources :messages, except: [:new]
  root 'messages#index'
end
