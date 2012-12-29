BssNewPortal::Application.routes.draw do

  # match '/editor(/*requested_uri)' => 'admin/dashboard', as: :mercury_editor

  mount Mercury::Engine => '/'

  resources :tracks, only: [ :show, :index ]
  resources :semesters do  
    resources :lessons, only: [ :show, :index ]
  end
  resources :users, except: [ :edit, :update, :show ]

  resources :signups, only: [ :create, :destroy ]

  controller :sessions do
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'logout' => :destroy
  end  

  controller :recover_accounts do 
    get 'recover_account' => :new
    post 'recover_account' => :create
  end


  namespace :admin do
    resources :pages do 
      get 'template', on: :collection
    end
    resources :users do 
      put 'make_active', on: :member
    end
    resources :tracks 
    resources :semesters do
      resources :lessons do
        resources :attachments
        resources :images
      end
      resources :days
    end
    # resources :lessons do
    #   member { put :mercury_update }
    # end
    get '', to: 'dashboard#show', as: '/'
  end

  get 'tracks/:track_name', to: 'tracks#show', as: :track_name

  root to: 'pages#home'
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
end
