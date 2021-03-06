Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/post',   to: 'home#index'
  get '/mypage', to: 'home#index'
  get '/search', to: 'home#index'
  get '/log_in', to: 'home#index'
  get '/sign_in', to: 'home#index'
  
  namespace :api, format: 'json' do
    resources :posts, only: [:index, :create, :update]
    post "posts", to: "posts#create"
    post "users", to: "users#create"
    post "auth/verification", to: "auth#verification"
    get  "user/log_in", to: "users#log_in"
    post "user/log_out", to: "users#log_out"    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
