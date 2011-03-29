ActionMailer::Base.smtp_settings = {
  :address  => ENV['MAIL_SMTP'],
  :port     => ENV['MAIL_PORT'].to_i,
  :domain   => ENV['MAIL_DOMAIN'],
  :user_name => ENV['MAIL_USER'],
  :password   => ENV['MAIL_PASSWORD'],
  :autentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = Rails.env.production? ? "aeto.com" : "localhost:3000"
