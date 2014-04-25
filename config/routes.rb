require 'constraints/production_path_constraint'

RailsBaseApp::Application.routes.draw do

  root              to: 'pages#home'
  get   'timeout',  to: 'pages#timeout'
  get   'kitchensink', to: 'pages#kitchensink'

  # catch rest of production paths with 404 page
  match '*path',    to: 'pages#not_found', via: [:get, :post],
                                        constraints: ProductionPathConstraint.new

end
