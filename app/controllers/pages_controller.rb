class PagesController < ApplicationController
  def home
    flash.now[:welcome] = "Welcome to #{Rails.application.class.parent_name.titleize}!"
  end
end