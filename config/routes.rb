Rails.application.routes.draw do

  get 'login', to: 'sessions#new' # ログイン画面
  post 'login', to: 'sessions#create' # ログイン処理

  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'

  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
