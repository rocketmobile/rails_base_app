class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.application.config.consider_all_requests_local == false
    rescue_from Exception, with: :exception
    rescue_from Timeout::Error, with: :exception
    rescue_from Rack::Timeout::Error, with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  protected

    def redirect_to_back(opts={})
      response_status_and_flash = opts.except(:or)
      url = :back if request.referrer.present?
      url ||= opts.delete(:or) || '/'

      redirect_to url, response_status_and_flash
    end
    def exception(exception)
      return render "pages/error", status: 500
    end
    def record_not_found(exception)
      return render "pages/not_found", status: 404
    end
end
