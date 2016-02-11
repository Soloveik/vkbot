Rails.application.routes.draw do
  resources :tokens
  get '/manager' => 'managers#index', as: :manager

  root 'managers#index'
end
