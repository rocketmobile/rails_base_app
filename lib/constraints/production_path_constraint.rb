class ProductionPathConstraint
  def matches?(request)
    return true if Rails.env.production?

    # Rails convenience paths aren't production paths
    request.path !~ /\A\/?rails/
  end
end