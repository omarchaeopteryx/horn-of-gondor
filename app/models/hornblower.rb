class Hornblower < ApplicationRecord


  def send_message(phone_number, alert_message, image_url)
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    client.messages.create(
      from: twilio_number,
      to:   phone_number,
      body: alert_message,
      # US phone numbers can make use of an image as well
      # media_url: image_url
    )
  end

end
