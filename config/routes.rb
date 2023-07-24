Rails.application.routes.draw do
 
  #get 'users/index'
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  devise_for :users
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #post 'books' => 'books#create'
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
