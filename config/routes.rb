Rails.application.routes.draw do
  root		 'static_pages#home'
  post     '/add_item' , to: 'carts#add_item' ,as: 'add_item'
  get		   '/help',		to: 'static_pages#help'
  get		   '/about',		to: 'static_pages#about'
  get		   '/contact',		to: 'static_pages#contact'
  get		   '/signup',		to: 'users#new'
  get		   '/login',		to: 'sessions#new'
  post		 '/login',		to: 'sessions#create'
  delete	 '/logout',		to: 'sessions#destroy'
  resources :users
  resources :carts, only: [:index,:show]
  resources :cds, only: [:index,:new,:create]
  resources :items, only: [:index,:new,:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
