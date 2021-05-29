Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  
  resources :users do
    resources :galleries
  end

  resources :galleries do
    resources :posts
  end

  root to: "home#index"
end
