Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:show, :edit, :index, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about' => "homes#about", as: 'about'

end
