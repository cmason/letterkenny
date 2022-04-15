Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path, constraints: lambda { |req| req.session[:user_id].present? }

  namespace :quotes do
    get "random", to: "random#index", as: "random"
    get "random/:slug", to: "random#show", as: "random_character"
  end
  resources :characters, param: :slug do
    resources :quotes, shallow: true
  end

  get "sessions/create", to: "sessions#create", as: :create_session
  get "sessions/destroy", to: "sessions#destroy", as: :destroy_session
  get "pages/about"
  root "pages#root"
end
