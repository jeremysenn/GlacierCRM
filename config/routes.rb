GlacierCRM::Application.routes.draw do
  
  resources :documents

  #Route to catch the response when Google sends us a callback (same one from RailsCasts episode)
# match "/auth/:provider/callback" => "sessions#create"
  match "/auth/:provider/callback" => "omniauth_callbacks#all"

  resources :missions

  resources :cases

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
#  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users

  resources :searches
end