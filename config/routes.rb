Rails.application.routes.draw do
  root 'root#index'

  resources :contacts
  resources :companies
end
