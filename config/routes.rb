Rails.application.routes.draw do
  resources :zens
  root "zens#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
