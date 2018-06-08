# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

MyMailer::Base.smtp_settings = {
  :user_name => ENV['USERNAME'],
  :password => ENV['PASSWORD_SENDGRID'],
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}