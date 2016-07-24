Rails.application.routes.draw do
  resources :establishments
  resources :inspections
  resources :infractions
  root 'establishments#index'
end
