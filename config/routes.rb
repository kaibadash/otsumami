Rails.application.routes.draw do
  root to: 'top#index'
  # resources :users
  resources :sites
  resources :scraped_results, only: [:index]
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
end
