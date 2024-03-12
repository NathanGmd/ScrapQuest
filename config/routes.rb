Rails.application.routes.draw do
  get 'researches/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :researches do
    resources :filters, except: :destroy
    post :toggle, to: 'filters#toggle'
    post :toggle_age, to: 'filters#toggle_age'
  end
  resources :filters, only: []

  # Defines the root path route ("/")
  # root "posts#index"
end
