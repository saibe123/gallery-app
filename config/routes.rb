Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  
  resources :users do
    resources :galleries, only: [:create, :index, :show, :destroy, :edit, :new]
  end

  resources :galleries do
    resources :posts, only: [:create, :index, :show, :destroy, :edit, :new]
  end

  root to: "home#index"
end
