Rails.application.routes.draw do
  resources :users
  resources :products do
    collection do
      get 'new_many'
      post 'create_many'
    end
  end

  resources :categories do
    collection do
      get 'list'
    end

    member do
      get 'select'
    end
  end

  resource :user_session

  match 'login', to: 'user_sessions#new', via: :get
  match 'logout', to: 'user_sessions#destroy', via: :get

  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
