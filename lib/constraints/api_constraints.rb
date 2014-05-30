class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    puts @version
    @default || req.headers['Accept-Version'].include?("v#{@version}")
  end
end
