Adventuring::Application.routes.draw do

  root to: 'courses#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  ### Custom routes need to be above rest routes so they are routed to first.

  #organization
  get 'organizations/your_orgs' => 'organizations#your_orgs', :as => :your_orgs_organization
  get 'organizations/:id/offered_courses' => 'organizations#offered_courses', :as => :offered_courses_organization
  get 'organization/:id/pre_destroy' => 'organizations#pre_destroy', :as => :pre_destroy_organization

  #course
  get 'organizations/:organization_id/courses/:id/add_photos' => 'courses#add_photos', :as => :add_photos_organization_course

  # Only need this if we access courses direct.
  resources :courses

  resources :photos
  resources :reviews
  resources :home
  resources :roles
  resources :profiles
  resources :instructors

  resources :organizations do
    resources :courses do
      resources :sections
    end
  end

end


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
