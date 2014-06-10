module ApplicationHelper
  def link_to_back(text, opts = {})
    html_options = opts.except(:or)
    url = request.referrer || opts.delete(:or) || '/'

    link_to text, url, html_options
  end
end
