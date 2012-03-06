Authui::Application.routes.draw do
  # resources :users

#     users GET    /users(.:format)          {:action=>"index", :controller=>"users"}
#           POST   /users(.:format)          {:action=>"create", :controller=>"users"}
#  new_user GET    /users/new(.:format)      {:action=>"new", :controller=>"users"}
# edit_user GET    /users/:id/edit(.:format) {:action=>"edit", :controller=>"users"}
#      user GET    /users/:id(.:format)      {:action=>"show", :controller=>"users"}
#           PUT    /users/:id(.:format)      {:action=>"update", :controller=>"users"}
#           DELETE /users/:id(.:format)      {:action=>"destroy", :controller=>"users"}

  # this is equivalent to resources :user, except we are passing in the param as :username instead
  # of the default :id
  match '/users(.:format)'                 => 'users#index',   :via => [:get],    :as => 'users'
  match '/users(.:format)'                 => 'users#create',  :via => [:post]
  match '/users/new(.:format)'             => 'users#new',     :via => [:get],    :as => 'new_user'
  match '/users/:username/edit(.:format)'  => 'users#edit',    :via => [:get],    :as => 'edit_user'
  match '/users/:username(.:format)'       => 'users#show',    :via => [:get],    :as => 'user'
  match '/users/:username(.:format)'       => 'users#update',  :via => [:put]
  match '/users/:username(.:format)'       => 'users#destroy', :via => [:delete]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

#  match 'users' => 'user#list'
#  match 'users/:username' => 'user#show'


  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
#  resources :users

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
