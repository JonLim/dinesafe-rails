Rails.application.routes.draw do
  get 'upload_logs/index'
  post 'upload_logs/upload'

  root 'establishments#index'

  resources :establishments
  resources :inspections
  resources :infractions
end
