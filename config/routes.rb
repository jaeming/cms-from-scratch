Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  #clearance routes start
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: :create
  resources :users, controller: "clearance/users", only: :create do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  #clearance routes end

  namespace :admin do
    resources :blog_posts
    resources :pages
    resources :galleries do
      resources :photo_posts, controller: 'galleries/photo_posts'
    end
    resources :tags
    resources :users
    resources :settings, only: [:index, :show, :update]
    get 'dashboard/index'
    root to: "dashboard#index"
  end

  resources :galleries, only: [:index, :show] do
    resources :photo_posts, only: [:show], controller: 'galleries/photo_posts'
  end
  resources :blog_posts, only: [:index, :show]
  resources :tags, only: [:index, :show]
  resources :pages, only: [:index, :show]

  get 'home/index'
  root to: 'home#index'

end
