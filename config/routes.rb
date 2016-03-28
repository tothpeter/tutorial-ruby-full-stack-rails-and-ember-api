Rails.application.routes.draw do

  root 'root#index'

  resources :contacts
  resources :companies
  resources :tasks
  resources :projects
  resources :notes
  resources :offers

  resources :authorization, only: [:create]
end
