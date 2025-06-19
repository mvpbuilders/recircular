Rails.application.routes.draw do
  devise_for :admin_users
  get 'explore/index'
  get 'search/index'
  root "home#index"
  get "search", to: "search#index", as: :search
  get 'explore', to: 'explore#index', as: :explore
  get 'explore/caro', to: 'explore#owner_products', defaults: { owner: 'Caro' }, as: :explore_caro
  get 'explore/:tipo', to: 'explore#index', as: :explore_tipo
  get "explore/by_owner", to: "explore#by_owner", as: :explore_by_owner
  get "vender", to: "pages#vender", as: :vender
  get 'owner/:owner', to: 'explore#owner_products', as: :owner_products
  get 'reset_cart', to: 'orders#reset_cart'

  post "/add_to_cart/:id", to: "session_cart#add_to_cart", as: :add_to_cart
  delete 'remove_from_cart/:id', to: 'session_cart#remove_from_cart', as: 'remove_from_cart'


  resources :products, only: [:show]

  namespace :admin do
    resources :products
    resources :clothing_products
    resources :furniture_products
    resources :kids_products
    resources :uniform_products
    resources :other_products
    resources :accessory_products

    resources :orders do
      collection do
        get :pending
        get :paid
      end
    end

    root to: "products#index"
  end


  resources :orders, only: [:create] do
    collection do
      get :checkout
    end

    member do
      get :resume
      get :payment
      post :create_preference
      post :process_payment
    end
  end


  post "payments/mp_hook", to: "payments#mp_hook"


end
