Rails.application.routes.draw do
  get 'auth/google_oauth2'
  resources :zens
  root "zens#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/auth/:provider/callback', to: 'auth/google_oauth2'
end
