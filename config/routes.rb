Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'posts/create'
  match 'items/index', via: [:get, :post]
  root 'users#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
   #:omniauth_callbacks => "users/omniauth_callbacks" 
  }
  resources :users, :only => [:index, :show] do
    get :favorites, on: :member
  end
  resources :relationships, :only =>[:create, :destroy]
  resources :items
  #resources :posts
  #resources :items
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resource :favorite, only: [:create, :destroy]
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
