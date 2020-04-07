Rails.application.routes.draw do
  get "pages/about"
  root to: "quotes#random"
  get "random", to: "quotes#random", as: "random_quote"
  get "random/:slug", to: "quotes#random", as: "random_character_quote"

  resources :quotes, only: :show
  # resources :characters
end
