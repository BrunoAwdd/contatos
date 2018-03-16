Rails.application.routes.draw do

  root 'static_pages#home'
  get 'about', controller:  :static_pages
  get 'vcard/upload'

  resources :newsletters do
    get 'send_newsletter'
    post 'send_mail'
  end
  devise_for :users, controllers: {sessions: "usuario/sessions"}

  resources :contatos do
    get 'migrate'
    collection do
      post :mass_action
    end
    resources :notes, :only => [:edit, :create, :index, :destroy]
  end
  resources :ajaxcontatos

  namespace :usuario do
    resources :generals
    resources :messages
    resources :roles
  end

  namespace :credit do
    resources :documents
    namespace :bank do
      resources :generals
    end
    namespace :client do
      resources :generals do
        get 'find_expired'
      end
      namespace :partner do
        resources :document_lists
      end
      namespace :warranty do
        resources :document_lists
      end
    end
  end

  namespace :business do
    resources :notes
    resources :histories
    resources :generals
  end


  namespace :juridico do
    resources :andamentos
    resources :processos
  end

  namespace :product do
    resources :documents
    resources :generals
  end




  #post 'vcard/create'

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
