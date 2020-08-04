Rails.application.routes.draw do

  root 'top#index'

  get '/about' => 'top#about', as: 'about'

  scope :user do
  	resources :genres, only: [:index, :create]
    resources :favorites, only: [:index]
  end

  resources :user, only: [:index, :show]

  resources :reviews do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
