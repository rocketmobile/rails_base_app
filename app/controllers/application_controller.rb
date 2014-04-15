class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

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

  private
    def set_locale
      visitor_locale = params[:locale].to_sym if I18n.available_locales.include?(params[:locale].try(:to_sym))
      from_param = !visitor_locale.nil?

      visitor_locale ||= cookies[:locale].to_sym if I18n.available_locales.include?(cookies[:locale].try(:to_sym)) #forwards compatibility with lang code changes
      # visitor_locale ||= request.preferred_language_from(I18n.available_locales).try(:to_sym)
      # visitor_locale ||= request.compatible_language_from(I18n.available_locales).try(:to_sym)
      visitor_locale ||= I18n.default_locale

      cookies.permanent[:locale] = visitor_locale

      # redirect to either:
      # a) remove locale from path if default and present, or
      # b) user's locale if not default and not in url already
      return redirect_to params.merge!(locale: "") if from_param && visitor_locale == I18n.default_locale
      return redirect_to params.merge!(locale: visitor_locale) if !from_param && visitor_locale != I18n.default_locale

      I18n.locale = visitor_locale.to_sym
    end
end