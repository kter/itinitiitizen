Rails.application.routes.draw do
  get 'auth/index'
  resources :user
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :zens
  root "zens#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static/privacy_policy'
  get 'static/menseki'

  get 'auth/sign_out'
end
