Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = "daylightsavings@gmail.com"
  config.allow_sign_up = false
  config.redirect_url = '/admin'
end
