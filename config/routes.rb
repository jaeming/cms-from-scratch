Rails.application.routes.draw do

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

  get 'settings/update'

  resources :entries
  resources :tags, only: :index

  get 'tags/:tag', to: 'entries#index', as: "tag",
    :constraints => lambda { |request| request.params[:tag]}

  root 'entries#index'

end
