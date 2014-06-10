module VerboseErrors
  extend ActiveSupport::Concern

  def full_messages_and_parameters
    messages_and_parameters = []
    if self.try(:errors).present?
      self.errors.keys.each do |parameter|
        messages = self.errors.full_messages_for(parameter)
        messages.each do |message|
          messages_and_parameters << { 'parameter' => parameter.to_s, 'message' => message }
        end
      end
    end
    messages_and_parameters
  end
end