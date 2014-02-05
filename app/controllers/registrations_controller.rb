class RegistrationsController < ::Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :avatar
  end
end