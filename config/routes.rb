require 'constraints/production_path_constraint'

RailsBaseApp::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations",
                                    sessions: "sessions",
                                    passwords: "passwords" }
  root :to => 'pages#home'

  # catch rest of production paths with 404 page
  match '*path', to: 'pages#not_found', via: [:get, :post],
                                        constraints: ProductionPathConstraint.new

end
