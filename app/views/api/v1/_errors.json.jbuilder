json.errors resource.full_messages_and_parameters.each do | hsh |
  json.parameter hsh['parameter']
  json.message hsh['message']
end