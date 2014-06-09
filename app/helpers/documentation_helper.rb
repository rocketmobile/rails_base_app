module DocumentationHelper
  def param_title(name, opts={})
    render 'param_title', name: name, required: opts[:required], default: opts[:default]
  end
  def attr_title(name, opts={})
    render 'attribute_title', name: name, type: opts[:type], value: opts[:value]
  end
  def endpoint_summary(method, path, opts={})
    render 'endpoint_summary', method: method, path: path, arguments: opts[:arguments]
  end
end