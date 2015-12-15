Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :pages
  #elfinder/tinymce
  get '/elfinder_manager', to: 'elfinder#index'
  match 'elfinder' => 'elfinder#elfinder', via: [:get, :post]

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

  resources :blog_posts
  resources :tags, only: [:index, :show]
  resources :settings, only: [:index, :show, :update]

  get 'home/index'
  root to: 'home#index'

end
