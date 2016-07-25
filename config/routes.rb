Rails.application.routes.draw do
  root 'establishments#index'
  post 'establishments/upload'

  resources :establishments
  resources :inspections
  resources :infractions
end
