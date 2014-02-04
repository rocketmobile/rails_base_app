class BaseMailer < ActionMailer::Base
  default from: ENV["NO_REPLY_EMAIL_ADDRESS"] || "no-reply@example.com"
end
