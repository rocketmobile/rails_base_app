module ApiHelpers
  def json_response
    body = JSON.parse(response.body)
    body = body.with_indifferent_access if body.is_a?(Hash)
    body
  end
end
