Rails.application.routes.draw do

  root "pages#index", as: :main

  resources :spots
  resources :users
  resources :places do
    resources :pics
  end
  get '/categories' => 'categories#index'
  namespace :categories do
    get '/restaurants' => 'restaurants#index'
    get '/bars' => 'bars#index'
    get '/intellectual' => 'intellectual#index'
    get '/shopping' => 'shopping#index'
    get '/bored' => 'bored#index'
    get '/active' => 'active#index'
    get '/outdoors' => 'outdoors#index'
    get '/broke' => 'broke#index'
  end
  post '/attendees' => 'attendees#create'

  get '/signin' => 'authenticates#signin'
  post '/signin' => 'authenticates#create'

  get '/signup' => 'registers#signup'
  post '/signup' => 'registers#create'

  get '/signout' => 'authenticates#destroy'

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
