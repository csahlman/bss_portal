BssNewPortal::Application.routes.draw do

  # match '/editor(/*requested_uri)' => 'admin/dashboard', as: :mercury_editor

  mount Mercury::Engine => '/'

  get 'pages/index'

  resources :tracks, only: [ :show, :index ]
  resources :semesters, only: [ :show, :index ] do  
    resources :lessons, only: [ :show, :index ]
  end

  resources :users, only: [ :edit, :update ]

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

  resources :class_signups, only: [ :create, :destroy ]

  namespace :admin do
    resources :lesson_templates
    resources :pages do 
      get 'template', on: :collection
    end
    resources :users do 
      put 'make_active', on: :member
    end
    resources :signups, only: [ :create, :destroy ]
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

  namespace :teachers do 
    # namespace for teacher edits
  end

  get 'tracks/:track_name', to: 'tracks#show', as: :track_name

  root to: 'pages#home'

end
