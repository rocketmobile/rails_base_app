class TwilioClient
  require 'twilio-ruby'

  self.instance_eval do
    def deliver!(recipient_number, text)
      new.deliver!(recipient_number, text)
    end
  end

  def number
    Rails.application.secrets.twilio_number
  end

  def client
    @@client ||= begin
      Twilio::REST::Client.new(Rails.application.secrets.twilio_id,
                               Rails.application.secrets.twilio_token)
    end
  end

  def deliver!(recipient_number, text)
    client.account.messages.create(
      from: self.number,
      to: recipient_number,
      body: text
    )
  end
end