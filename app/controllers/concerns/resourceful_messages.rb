module ResourcefulMessages
  extend ActiveSupport::Concern

  def success_message
    t(".success", resouce: current_resource_name, default: default_success_message)
  end
  def default_success_message
    t("actioncontroller.#{request.params[:action]}.success", resource: current_resource_name)
  end
  def current_resource_name
    key = current_resource.class.name.downcase
    key = "activerecord.models.#{key}" if current_resource.class.ancestors.include? ActiveRecord::Base

    t(key, default: current_resource.class.name.humanize,
           count: collection_action? ? current_resource.count : 1)
  end
  def current_resource
    @current_resource ||= begin
      implied_resource = self.class.name.split('::').last.sub('Controller', '').downcase
      implied_resource = implied_resource.singularize unless collection_action?
      self.instance_variable_get "@#{implied_resource}"
    end
  end
  def collection_action?
    request.params[:action] == 'index'
  end
end