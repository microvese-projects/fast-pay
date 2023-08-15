Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'
  resources :users do
    resources :groups do
      resources :dealings
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
