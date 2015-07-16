Rails.application.routes.draw do
  get 'users/index'
  get 'posts/create'
  match 'items/index', via: [:get, :post]
  get 'items/create'
  root 'posts#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }
  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  resources :relationships, :only =>[:create, :destroy]
  resources :items, :only =>[:index, :create, :show]
  resources :replies, :only =>[:destroy, :create] 
  resources :users do
    member do
      get :following, :followers
    end
    get :favorites, on: :member
    get :posts, on: :member
  end
  resources :posts do
    resource :favorite, only: [:create, :destroy]
  #  get :samebook, on: :collection
  end
  namespace :admins do
    resources :users, :only =>[:index, :destroy]
    resources :posts, :only =>[:index, :destroy]
  end
=begin
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
=end  


#devise_for :users
#resources :users, :only => [:index, :show]
# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
end
