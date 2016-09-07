Rails.application.routes.draw do
  resources :bots, :themes, :tokens
  get '/manager' => 'managers#index', as: :manager

  root 'managers#index'
end
