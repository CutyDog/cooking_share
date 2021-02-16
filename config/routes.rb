Rails.application.routes.draw do
  root to: 'home#index'
  get '/post',   to: 'home#index'
  get '/mypage', to: 'home#index'
  get '/search', to: 'home#index'
  
  namespace :api, format: 'json' do
    resources :posts, only: [:index, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
