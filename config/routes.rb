RailsBaseApp::Application.routes.draw do

  root :to => 'pages#home'

  get "grid" => 'pages#grid'

end
