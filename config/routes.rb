Rails.application.routes.draw do

  resources :entries
  resources :tags, only: :index

  get 'tags/:tag', to: 'entries#index', as: "tag",
    :constraints => lambda { |request| request.params[:tag]}

  root 'entries#index'

end
