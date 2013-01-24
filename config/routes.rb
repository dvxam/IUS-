Ius::Application.routes.draw do

  get "pages/apropos"

  get "pages/confidentialite"

  get "pages/conditions"

  get "pages/aide"
  
  get "pages/home"

  get "pages/public"

  resources :attachements

  resources :comments

  resources :schools

  resources :class_rooms

  resources :annexes

  resources :folders

  resources :tags

  resources :user_types

  resources :users

  resources :posts

  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'posts_by_class_room' => 'posts#by_class_room', :as => :posts_by_class_room

  match 'teacher/new' => 'users#add_teacher', :as => :add_teacher
  match 'users/:id/classmates' => 'users#classmates', :as => :classmates

  match 'users/:id', :to => 'users#show', :as => :user

  match '/edit_avatar', :to => 'users#edit_avatar', :as => :edit_avatar


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
