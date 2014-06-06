class Api::V1::DocumentationController < ApplicationController
  layout 'documentation'
  helper_method :documentation_topics

  def index
    @topics = documentation_topics.keys.map{|t| t.flatten.first }

    prepend_view_path "app/views/api/v1/documentation/"
  end

  protected

    def documentation_topics
      {
        {'introduction' => 'Introduction'} => [],
        {'authentication' => 'Authentication'} => [],
        {'versioning' => 'Versioning'} => [],
        {'errors' => 'Errors'} => [],
        {'i18n' => 'Internationalization'} => [],
        {'lapses' => 'Lapses'} => [
                                     {'lapses/create' => 'Create a new lapse'},
                                     {'lapses/show' => 'Retrieve an existing lapse'},
                                     {'lapses/update' => 'Update a lapse'},
                                     {'lapses/destroy' => 'Delete a lapse'},
                                     {'lapses/index' => 'List all lapses'}
                                   ],
        {'moments' => 'Moments'} => []
      }
    end
end