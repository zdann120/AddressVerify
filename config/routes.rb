Rails.application.routes.draw do
  namespace :address do
    resources :verifications, except: [:index] do
      get '/', on: :collection, to: 'verifications#new'
    end
    resources :submissions, except: [:index] do
      post 'process_login', on: :collection, to: 'submissions#process_login'
      get '/', on: :collection, to: 'submissions#login'
      get 'success', on: :collection, to: 'submissions#success'
    end
  end

  get 'visitors/index'

  resources :addresses
  devise_for :users

  scope :webhooks do
    post 'postcards', to: 'webhooks#postcards'
  end

  get '/verify', to: 'address/verifications#new'

  root to: 'visitors#index'
end
