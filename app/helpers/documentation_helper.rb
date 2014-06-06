module DocumentationHelper
  def param_title(name, opts={})
    render 'param_title', name: name, required: opts[:required], default: opts[:default]
  end
end