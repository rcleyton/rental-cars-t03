Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :manufacturers, only: [:index, :new, :show, :create]
  resources :subsidiaries, only: [:index, :show]
  
end
