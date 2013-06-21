GlacierCRM::Application.routes.draw do
  resources :todos

  resources :companies

#  resources :contacts
  resources :contacts do
    collection { post :import }
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :searches
end