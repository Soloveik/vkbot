Rails.application.routes.draw do
  resources :themes
  resources :tokens
  get '/manager' => 'managers#index', as: :manager

  root 'managers#index'
end
