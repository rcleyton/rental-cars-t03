Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :new, :show, :create, :edit, :update]
  resources :car_categories, only: [:index, :new, :show, :create]
  resources :customers, only: [:index, :new, :show, :create] do
    get 'search', on: :collection
  end
  resources :car_models, only: [:index, :new, :show, :create]
  resources :rentals, only: [:index, :new, :show, :create] do
    get 'search', on: :collection
    resources :car_rentals, only: [:new, :create]
  end
  
end
