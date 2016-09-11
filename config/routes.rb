Rails.application.routes.draw do
  resources :bots, :themes, :tokens
  get '/manager' => 'managers#index', as: :manager
  get '/bot_activation' => 'managers#bot_activation', as: :bot_activation
  get '/create_themes_by_groups' => 'managers#create_themes_by_groups', as: :create_themes_by_groups
  get '/delete_unpopulare_topics' => 'managers#delete_unpopulare_topics', as: :delete_unpopulare_topics
  get '/send_message' => 'managers#send_message', as: :send_message
  get '/to_accept_requests' => 'managers#to_accept_requests', as: :to_accept_requests
  get '/test_1' => 'managers#test_1', as: :test_1
  
  root 'managers#index'
end
