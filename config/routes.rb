Rails.application.routes.draw do
  resources :offers
  root 'root#index'

  resources :contacts
  resources :companies
  resources :tasks
  resources :projects
end
