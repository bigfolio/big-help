ActionController::Routing::Routes.draw do |map|
  map.resources :clients

  map.resources :clients

  
  map.root :controller => 'help'
  
  map.resources :messages

  map.resources :categories, :has_many => :faqs

  map.resources :faqs

  map.resources :tickets, :has_many => :messages, :collection => {:fresh => :get, :active => :get}, :member => {:activate => :any, :close => :any, :research => :any}

  map.faqs_by_category '/help/faqs/:id', :controller => 'help', :action => 'faqs'
  
  map.connect '/help/new', :controller => 'tickets', :action => 'new'
  
  map.view_by_key '/help/view/:key', :controller => 'help', :action => 'view_by_key'
  map.key_search '/help/key_search', :controller => 'help', :action => 'search_by_key'
  map.search '/help/search', :controller => 'help', :action => 'search'
  
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  # map.signup '/signup', :controller => 'users', :action => 'new'
  map.profile '/profile', :controller => 'users', :action => 'edit'
  
  map.contact '/contact', :controller => 'help', :action => 'contact'
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
