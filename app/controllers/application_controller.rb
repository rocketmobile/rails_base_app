class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_to_back(opts={})
    response_status_and_flash = opts.except(:or)

    begin
      redirect_to :back, response_status_and_flash
    rescue ActionController::RedirectBackError
      redirect_to(opts[:or] || root_path, response_status_and_flash)
    end
  end

  def link_to_back(text, opts = {})
    html_options = opts.except(:or)
    url = request.referrer || opts.delete(:or) || '/'

    link_to text, url, html_options
  end
end
