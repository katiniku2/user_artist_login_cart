Rails.application.routes.draw do
  get 'posts/search'
  get 'favorites/create'
  get 'favorites/destroy'
  root		'static_pages#home'
  post    '/add_item' ,       to: 'carts#add_item' ,as: 'add_item'
  get     '/help',            to: 'static_pages#help'
  get     '/about',		        to: 'static_pages#about'
  get     '/contact',	        to: 'static_pages#contact'
  get     '/signup',	        to: 'users#new'
  post    '/signup',          to: 'users#create'
  get     '/login',		        to: 'sessions#new'
  post		'/login',		        to: 'sessions#create'
  delete	'/logout',	        to: 'sessions#destroy'
  get     '/signup_artist',   to: 'artists#new',                as: 'signup_artist'
  post    '/signup_artist',   to: 'artists#create'
  get     '/artist_show/:id', to: 'artists#show',               as: 'artist_show'
  delete  '/artist_logout',   to: 'sessions#destroy_artist',    as: 'logout_artist'
  get     '/login_artist',    to: 'sessions#new_artist'
  post    '/login_artist',    to: 'sessions#artist_create'

  resources :users
  resources :carts, only: [:index,:show]
  resources :cds, only: [:index,:new,:create]
  resources :items, only: [:index,:new,:create]
  resources :artists do
    post '/artists/:artist_id/add' => 'favorites#create'
    delete '/artists/:artist_id/add' => 'favorites#destroy'
  end

  get 'search', to:'application#set_search'

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :artists, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
