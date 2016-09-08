Rails.application.routes.draw do
  resources :bots, :themes, :tokens
  get '/manager' => 'managers#index', as: :manager
  get '/bot_activation' => 'managers#bot_activation', as: :bot_activation

  root 'managers#index'
end
