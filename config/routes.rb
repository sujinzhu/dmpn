Rails.application.routes.draw do
  resources :products
  resources :categories do
    collection do
      get 'list'
    end

    member do
      get 'select'
    end
  end
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
