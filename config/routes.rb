Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/about', to: 'pages#about'
  
  resources :articles

  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :users, except: [:new]
  
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
