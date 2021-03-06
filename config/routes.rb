Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  namespace :admin do
    resources :categories
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
        post :apply_to_cancel
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
    end
    collection do
      get :search
    end
    resources :reviews
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :favorites

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
