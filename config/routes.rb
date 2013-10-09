RailsBaseApp::Application.routes.draw do

  root :to => 'pages#home'

  get "grid" => 'pages#grid'

  # catch rest of paths with 404 page
  match '*path', to: 'pages#not_found', via: [:get, :post]

end
