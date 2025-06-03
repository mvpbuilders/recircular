Rails.application.routes.draw do
  get 'products/show'
  get 'explore/index'
  get 'search/index'
  root "home#index"
  get "search", to: "search#index", as: :search
  get 'explore', to: 'explore#index', as: :explore
  get 'explore/:tipo', to: 'explore#index', as: :explore_tipo
  get "explore/by_owner", to: "explore#by_owner", as: :explore_by_owner
  get "vender", to: "pages#vender", as: :vender
  get 'owner/:owner', to: 'explore#owner_products', as: :owner_products



  resources :products, only: [:show]


  namespace :admin do
    resources :products
    resources :clothing_products
    resources :furniture_products
    resources :kids_products
    resources :uniform_products
    resources :other_products
    resources :accessory_products
    root to: "products#index"
  end

  resources :orders, only: [:create] do
    member do
      get :checkout
    end
  end

end
