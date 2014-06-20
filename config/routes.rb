Rails.application.routes.draw do

  root 'rails_home#index'

  get 'rails_home/index'

  resources :matches

  resources :teams

end
