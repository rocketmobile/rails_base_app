module Attachable
  extend ActiveSupport::Concern

  module ClassMethods
    def has_attachment(attachment_name, opts={})
      # translate options to paperclip format
      opts[:s3_headers] = { "x-amz-server-side-encryption" => "AES256" } if opts.delete(:encrypted_storage)

      if asset = opts.delete(:default_asset)
        opts[:default_url] = ActionController::Base.helpers.asset_path(asset)
      end

      # create helper methods for easy updating of attachment
      # TODO: declare these in a protected scope
      define_method "delete_#{attachment_name}=" do | checkbox_val |
        # via update_attributes({delete_<file>: '1'})
        self.send(attachment_name).clear if checkbox_val == '1'
      end

      define_method "#{attachment_name}_remote_url=" do | attachment_url |
        # via update_attributes({<file>_remote_url: 'url_string'})
        self.send("#{attachment_name}=", URI.parse(attachment_url).to_s) unless attachment_url.blank?
      end

      # proxy declaration of paperclip attachment
      has_attached_file attachment_name, opts
    end
  end
end