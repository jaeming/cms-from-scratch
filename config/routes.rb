Rails.application.routes.draw do
  root 'entries#index'
  get 'tags/:tag', to: 'entries#index', as: "tag"
  resources :entries
end
