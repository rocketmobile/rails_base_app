module VerboseErrors
  extend ActiveSupport::Concern

  def full_messages_and_parameters
    if self.try(:errors).present?
      messages_and_parameters = []

      self.errors.keys.each do |parameter|
        messages = self.errors.full_messages_for(parameter)
        messages.each do |message|
          messages_and_parameters << { 'parameter' => parameter.to_s.titleize, 'message' => message }
        end
      end
      return messages_and_parameters
    else
      raise 'No errors present!'
    end
  end
end