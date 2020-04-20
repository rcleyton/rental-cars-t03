Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers, only: [:index, :new, :show, :create, :edit, :update]
  resources :subsidiaries, only: [:index, :new, :show, :create]
  resources :car_categories, only: [:index, :new, :show, :create]
  resources :customers, only: [:index, :new, :show, :create]
end
