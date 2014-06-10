if current_resource.try(:errors).present?
  json.partial! 'api/v1/errors', resource: current_resource
end

json.merge! JSON.parse(yield)