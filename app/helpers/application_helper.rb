module ApplicationHelper
  def link_to_back(text, opts = {})
    html_options = opts.except(:or)
    url = request.referrer || opts.delete(:or) || '/'

    link_to text, url, html_options
  end
  def append_to_json_object_buffer(buffer, object)
    buf_matches = buffer.match(/(.*)}\z/)
    obj_matches = object.to_json.to_s.match(/\A{(.*)}\z/)
    if buf_matches and obj_matches
      buf_matches[1].html_safe + ",#{obj_matches[1]}}".html_safe
    else
      raise 'Buffer is not a valid json object, or object being appended cannot be converted to json. It must start and end with curly brackets.'
    end
  end
end
