require 'constraints/production_path_constraint'

RailsBaseApp::Application.routes.draw do

  root              to: 'pages#home'
  post 'messages',   to: 'pages#create'
  get  'timeout',   to: 'pages#timeout'

  # catch rest of production paths with 404 page
  match '*path',    to: 'pages#not_found', via: [:get, :post],
                                        constraints: ProductionPathConstraint.new

end
