Rails.application.routes.draw do
  get 'public/index'
  get 'public/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public#index'


  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  
  resources :public

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end
  
  resources :pages do
    member do
      get :delete
    end
  end


  match '/:id', to: "public#show", via: ['GET']

end
