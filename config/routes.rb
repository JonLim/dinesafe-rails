Rails.application.routes.draw do
  get 'upload_logs/index'
  get 'upload_logs/upload'

  root 'establishments#index'

  resources :establishments
  resources :inspections
  resources :infractions
end
