Rails.application.routes.draw do

  resources :products, only: [:index]
  root "home#index"

end
