class PagesController < ApplicationController
  def home
    flash.now[:welcome] = "Welcome to RailsBaseApp!"
  end
end