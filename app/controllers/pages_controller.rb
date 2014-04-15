class PagesController < ApplicationController
  def home
    flash.now[:welcome] = t('pages.home.welcome_flash')
  end
end