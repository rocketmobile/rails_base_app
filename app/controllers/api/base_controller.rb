class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  layout false

  rescue_from Exception, with: :internal_error
  rescue_from Timeout::Error, with: :timeout
  rescue_from Rack::Timeout::Error, with: :timeout
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  protected
    def bad_request
      return render "api/errors/bad_request", status: 400
    end
    def conflict
      return render "api/errors/conflict", status: 409
    end
    def forbidden
      return render "api/errors/forbidden", status: 403
    end
    def internal_error(exception)
      return render "api/errors/internal_error", status: 500
    end
    def invalid_resource
      return render "api/errors/invalid_resource", status: 400
    end
    def invalid_version
      return render "api/errors/invalid_version", status: 400
    end
    def not_found(exception)
      return render "api/errors/not_found", status: 404
    end
    def throttled
      return render "api/errors/throttled", status: 429
    end
    def timeout(exception)
      # If the timeout occured during the middle of a persistence layer query, we need to cancel the
      # query so that a "closed connection" exception isn't raised in the middle
      # of the next request that executes a query
      ActiveRecord::Base.connection.reset!
      return render "api/errors/timeout", status: 503
    end
    def unauthenticated
      return render "api/errors/unauthenticated", status: 401
    end
end
