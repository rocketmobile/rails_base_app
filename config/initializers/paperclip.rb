if ENV['AWS_BUCKET']
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_credentials] = {
    :bucket => ENV['AWS_BUCKET'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }
  puts "=> Paperclip storage set to S3: #{Paperclip::Attachment.default_options[:fog_directory]}"
else
  puts "=> Paperclip storage set locally, no AWS_BUCKET ENV var found."
end