Rails.application.routes.draw do



  resources :photo_posts
  resources :galleries
  mount Ckeditor::Engine => '/ckeditor'


  #clearance routes start
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  #clearance routes end

  namespace :admin do
    resources :blog_posts
    resources :pages
    get 'dashboard/index'
    root to: "dashboard#index"
  end

  resources :blog_posts
  resources :tags, only: [:index, :show]
  resources :settings, only: [:index, :show, :update]
  resources :pages, only: [:index, :show]

  get 'home/index'
  root to: 'home#index'

end
