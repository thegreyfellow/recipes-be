Rails.application.routes.draw do
  resources :ingredients, only: [:index]
  resources :recipes, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
