Rails.application.routes.draw do
  resources :coupons
  resources :orders
  resources :addresses
  devise_for :users
  resources :reviews
  resources :categories
  resources :products
  resources :cart_line_items
  resources :wishlist_items

  get 'say/goodbye'
  get 'say/hello'
  root 'say#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
