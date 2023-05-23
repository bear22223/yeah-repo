Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get 'tasks'
      post 'tasks'
      get 'tasks/new'
      
    end
    resources :tasks, only: :update
    resources :tasks, only: :index
    
  end
end
