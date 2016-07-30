Rails.application.routes.draw do
  get '/stats', to: 'upload_logs#index'

  root 'establishments#index'

  resources :establishments
  resources :inspections
  resources :infractions
end
