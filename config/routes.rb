Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :edit, :destroy, :update]
    resources :goods, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
