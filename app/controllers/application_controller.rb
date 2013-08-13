class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_to_back(opts={})
    begin
      redirect_to :back, opts
    rescue ActionController::RedirectBackError
      redirect_to(opts[:or] || root_path, opts)
    end
  end
end
