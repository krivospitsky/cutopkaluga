Shop::Application.routes.draw do
  resources :orders

  mount Ckeditor::Engine => '/ckeditor'
  resources :pages

  resources :manufacturers

  resources :categories
  resources :products

  get 'search' => 'products#search'
  resources :main

  resources :cart_items
  get 'login' => 'auth#index'
  post '/cart/add' => 'cart#add'
  get '/cart' => 'cart#index'
  get '/cart/delete/:product_id' => 'cart#delete'

    # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

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
  devise_for :admins

  namespace :admin do
    resources :products
    resources :categories
    resources :pages
    get '/settings/edit' => '/admin/settings#edit'
    post '/settings/edit' => '/admin/settings#update'
  end
end