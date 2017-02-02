class HornblowersController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @hornblow = Hornblower.new
    render :index
  end

  def new
    @phone_number = params[:number] #FIX
    alert_message = "Gondor calls for aid!"
    image_url = 'http://vignette4.wikia.nocookie.net/lotr/images/4/4f/BoromirHorn.jpg/revision/latest?cb=20070419194711'
    send_message(@phone_number, alert_message, image_url)
    render :new
  end

  def create

  end

  private

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
