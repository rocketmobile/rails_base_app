class Message
  include ActiveModel::Model
  require 'twilio-ruby'

  attr_accessor :to, :text

  validates_presence_of :to, :text
  validate :to_must_be_valid, if: 'to.present?'

  def deliver!
    TwilioClient.deliver!(self.to, self.text)
  end
  def deliver
    begin
      TwilioClient.deliver!(self.to, self.text)
    rescue StandardError => ex
      self.errors.add(:base, ex.message)
      return false
    end
    true
  end

  protected
    def to_must_be_valid
      digits = self.to.gsub(/(\A\+1|\A1-|\(|\)|\s|-|\.)/, '')
      if digits.length == 10
        self.to = digits
      else
        self.errors.add(:to, :invalid)
      end
    end
end