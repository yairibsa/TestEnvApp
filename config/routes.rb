Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  resources :comments, only: [:create]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
 
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  
  resources :guides do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
