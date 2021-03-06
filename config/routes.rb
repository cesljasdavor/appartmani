Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #user
  post 'login' , to: 'users#login'
  post 'register' , to: 'users#register'
  post 'logout', to: 'users#logout'
  post 'confirm_registration', to: 'users#confirm_registration'
  get 'users/get_active_users' , to: 'users#get_active_users'
  get 'users/get_admins', to: 'users#get_admins'
  post 'users/add_admin', to: 'users#add_admin'
  post 'users/remove_user', to: 'users#destroy'
  #user + reservations
  post 'users/get_reservations', to: 'users#get_reservations'


  #accommodations
  get 'accommodations/get_accommodations', to: 'accommodations#get_accommodations'
  post 'accommodations/get_free_room', to: 'accommodations#get_free_room'
  get 'accommodations/accommodation_statistics', to: 'accommodations#accommodation_statistics'
  post 'accommodations/rooms_reservations', to: 'accommodations#rooms_reservations'

  #reservations
  post 'reservations/add_reservation', to: 'reservations#add_reservation'
  get 'reservations/services_statistics', to: 'reservations#services_statistics'
  get 'reservations/service_dependencies', to: 'reservations#service_dependencies'
  get 'reservations/get_unconfirmed_reservations', to: 'reservations#get_unconfirmed_reservations'
  post 'reservations/confirm_first_reservation' , to: 'reservations#confirm_first_reservation'

  #persons
  get 'persons/country_statistics', to: 'persons#country_statistics'
  get 'persons/city_statistics', to: 'persons#city_statistics'

  resources :persons
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
