class PagesController < ApplicationController
  def home
    flash.now[:welcome] = t(:welcome_flash)
  end
end