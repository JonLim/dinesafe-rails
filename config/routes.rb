Rails.application.routes.draw do
  get 'upload_logs/index'

  get 'upload_logs/show'

  root 'establishments#index'
  post 'establishments/upload'

  resources :establishments
  resources :inspections
  resources :infractions
end
