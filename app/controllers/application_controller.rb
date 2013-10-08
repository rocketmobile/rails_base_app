class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

    def redirect_to_back(opts={})
      response_status_and_flash = opts.except(:or)
      url = :back if request.referrer.present?
      url ||= opts.delete(:or) || '/'

      redirect_to url, response_status_and_flash
    end
end
