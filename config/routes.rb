Rails.application.routes.draw do

  root 'top#index'

  get '/about' => 'top#about', as: 'about'

  scope :user do
  	resources :genres, only: [:index, :update, :create]
  end

  resources :user, only: [:index, :show]

  resources :reviews
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
