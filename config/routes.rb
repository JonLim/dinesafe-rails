Rails.application.routes.draw do
  get '/stats', to: 'upload_logs#index'
  get '/about', to: 'static_pages#about'

  root 'establishments#index'

  resources :establishments
  resources :inspections
  resources :infractions
end
