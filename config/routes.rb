Rails.application.routes.draw do

  root 'welcome#index'

#  get 'reservation/new'
  get '/new', to: 'reservations#new'
  get '/all', to: 'reservations#index'
  get '/success', to: 'reservations#success'
  get '/calendar', to: 'reservations#calendar'
  get '/conflicts', to: 'reservations#conflicts'
  put 'accept/:id', to: 'reservations#accept', as: :accept_reservation




  resources :reservations


  devise_for :users, :skip => :registerable


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#root 'static_pages#home'
#get  '/help',    to: 'static_pages#help'
#get  '/about',   to: 'static_pages#about'
#get  '/contact', to: 'static_pages#contact'
#get  '/signup',  to: 'users#new'
#resources :users
