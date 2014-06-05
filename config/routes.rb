require 'constraints/production_path_constraint'
require 'constraints/api_constraints'

RailsBaseApp::Application.routes.draw do

  # api*
  constraints subdomain: /\Aapi/ do
    scope module: "api/v1", constraints: ApiConstraints.new(version: 1, default: true) do
      resources :lapses, only: [:index, :show, :create, :update, :destroy], shallow: true do
        resources :moments, only: [:index, :show, :create, :destroy]
      end
    end
  end

  root              to: 'pages#home'
  get   'timeout',  to: 'pages#timeout'

  # catch rest of production paths with 404 page
  match '*path',    to: 'pages#not_found', via: [:get, :post],
                                        constraints: ProductionPathConstraint.new
end
