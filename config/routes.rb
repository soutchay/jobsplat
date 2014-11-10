Jobsplat::Application.routes.draw do
  root "users#index"
  # resources sessions, only: [:create, :new:, :destroy]
  get "sessions/new" => "sessions#new", as: :new_session

  post "sessions/" => "sessions#create"

  delete "sessions/" => "sessions#destroy", as: :destroy_session
# Users
  # this sets the main page to be the users#index.html.erb

  get "users/" => "users#index", as: :index

  get "users/new" => "users#new"

  post "users/" => "users#create"

  get "users/:id" => "users#show", as: :user

# Companies
  get "companies/" => "companies#index"

  get "companies/new" => "companies#new", as: :new_company

  get "companies/:id" => "companies#show", as: :company

  post "companies/" => "companies#create"

  delete "companies/:id" => "companies#destroy", as: :destroy_company

# Jobs
 # post 'jobs/update' => 'jobs#update', as: :update_jobs

  get "companies/:id/jobs" => "jobs#index", as: :jobs

  get "companies/:id/jobs/new" => "jobs#new", as: :new_job

  post "companies/:id/jobs" => "jobs#create"

  get "jobs/:job_id/edit" => "jobs#edit", as: :edit_job

  get "jobs/:job_id" => "jobs#show", as: :job

  patch "jobs/:job_id" => "jobs#update", as: :update_job

  delete "jobs/:job_id" => "jobs#destroy"


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
