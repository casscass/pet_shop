Rails.application.routes.draw do
  resources :products

  resources :customers do
    resources :orders, only: [ :index, :new, :create ]
  end
  
  resources :orders, except: [ :index, :new, :create ]
    # resources :tribbles
    # resources :sevices
    # resources :products, :destroy 
  
  # resources :stores
   #get 'store/index'

  # get 'store/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
