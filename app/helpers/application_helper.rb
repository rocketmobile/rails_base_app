module ApplicationHelper
  def link_to_back(text, opts = {})
    html_options = opts.except(:or)
    url = request.referrer || opts.delete(:or) || '/'

    link_to text, url, html_options
  end
  def prepare_resource_errors(errors)
    errors_array = []
    errors.each_key do |error_key|
      errors[error_key].each do |message|
        errors_array << {
          'attribute' => error_key,
          'message'   => message
        }
      end
    end
    errors_array
  end
end
