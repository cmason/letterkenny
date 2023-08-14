Rails.application.routes.draw do
  root "quotes/random#index"

  namespace :quotes do
    get "random", to: "random#index", as: "random"
    get "random/:slug", to: "random#show", as: "random_character"
  end
  resources :quotes, only: :show

  # resources :characters, param: :slug do
  # end

  get "sessions/create", to: "sessions#create", as: :create_session
  get "sessions/destroy", to: "sessions#destroy", as: :destroy_session
end
