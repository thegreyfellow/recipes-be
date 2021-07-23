Rails.application.routes.draw do
  defaults format: :json do
    scope '/api' do
      resources :ingredients, only: [:index]
      resources :recipes, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
