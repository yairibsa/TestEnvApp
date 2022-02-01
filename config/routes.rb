Rails.application.routes.draw do
  resources :messages, except: [:show]
  get 'message/:id', to: 'messages#show', as:'message_show'
  get 'user', to: 'messages#user'
  
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as:'portfolio_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :guides do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
