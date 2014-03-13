class StaticPaths
  self.instance_eval do
    def directory_url
      "#{Rails.application.config.action_controller.asset_host}/static"
    end
    def url_for(asset, opts={})
      base = "#{directory_url}/#{asset.gsub(/\A(\/|\s)*/, '')}" # strip leading slashes and/or whitespace
      base = base + "?#{SecureRandom.hex(8)}" if opts[:expire_cache] == true
      base
    end
    alias :directory_path :directory_url
    alias :path_for :url_for

    protected
      def method_missing(method, *args, &block)
        return super unless matches = method.to_s.match(/(.*)_(url|path)\z/)
        path, opts = *args

        url_for("#{matches[1].pluralize}/#{path}", opts || {})
      end
  end
end