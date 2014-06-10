class ApplicationController < ActionController::Base
  include ResourcefulMessages
  protect_from_forgery with: :exception

  if Rails.application.config.consider_all_requests_local == false
    # note: these are rescued from bottom (most specific) to top (least)
    rescue_from Exception, with: :exception
    rescue_from Timeout::Error, with: :timeout
    rescue_from Rack::Timeout::Error, with: :timeout
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
    def timeout(exception)
      # If the timeout occured during the middle of a persistence layer query, we need to cancel the
      # query so that a "closed connection" exception isn't raised in the middle
      # of the next request that executes a query
      ActiveRecord::Base.connection.reset!

      return render "pages/timeout", status: 503
    end
end
