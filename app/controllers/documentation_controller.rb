class DocumentationController < ApplicationController
  def index
    @topics = [
                'introduction',
                'authentication',
                'versioning',
                'errors',
                'i18n',
                'lapses',
                'moments'
              ]
  end
end