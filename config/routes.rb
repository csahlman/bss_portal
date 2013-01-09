BssNewPortal::Application.routes.draw do

  # match '/editor(/*requested_uri)' => 'admin/dashboard', as: :mercury_editor

  mount Mercury::Engine => '/'

  get 'pages/index'



  resources :tracks, only: [ :show, :index ]
  resources :semesters, only: [ :show, :index ] do  
    resources :lessons, only: [ :show, :index ]
  end

  resources :users, only: [ :edit, :update ]

  resources :users, only: [ :edit, :update, :show ]

  resources :signups, only: [ :create, :destroy ]

  resources :confirmations, only: [ :create ]
  resources :withdrawals, only: [ :create ]

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

    resources :activities do 
      resources :activity_list_items, only: [ :new, :create, :destroy ]
    end

    resource :decrement_list, only: [ :create ]
    resource :increment_list, only: [ :create ]

    resources :lesson_templates do
      post :toggle_default, on: :member
      resources :objectives
      resources :periods
      resources :images
      resources :attachments
    end

    resources :lessons, only: [ :show ] do 
      get 'lesson_info', on: :member
    end

    resources :periods do 
      resources :activities
    end
    resources :pages do 
      get 'template', on: :collection
    end
    resources :users do 
      put 'make_active', on: :member
    end
    resources :signups, only: [ :create, :destroy ]
    resources :tracks 
    resources :semesters do
      post :populate, on: :member
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
    resources :lessons, only: [ :edit, :update, :show ] do
      resources :attachments
      resources :images
      resources :periods
      resources :objectives
    end

    resources :periods do 
      resources :activities
    end
  end

  get 'tracks/:track_name', to: 'tracks#show', as: :track_name

  root to: 'pages#home'

end
