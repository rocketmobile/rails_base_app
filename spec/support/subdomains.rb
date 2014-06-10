def set_subdomain(subdomain)
  subdomain = subdomain.to_s
  subdomain = subdomain + '.' unless subdomain.end_with? '.'

  # # use exististing host (tld count = 1), allowing port,
  # # replacing subdomain with user value
  # host = default_url_options[:host].match(/(?:.*\.)?([^.]+\.[^.]+)/)[1]
  # default_url_options[:host] = "#{subdomain}#{host}"

  # use exististing host (tld count = 1), replacing port with
  # capybara server port and subdomain with user value
  host = Capybara.app_host.match(/(?:.*\.)?([^.]+\.[^:.]+)(?:\:\d*)?/)[1] rescue "lvh.me"
  Capybara.app_host = "http://#{subdomain}#{host}:#{Capybara.server_port}"
end

def reset_host
  # begin
  #   host = default_url_options[:host].match(/(?:.*\.)?([^.]+\.[^.]+)/)[1]
  #   default_url_options[:host] = "#{host}"
  # rescue StandardError
  #   # default_url_options don't exist on spec_helper initial load
  # end

  Capybara.app_host = nil
end
