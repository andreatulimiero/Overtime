class User < ActiveRecord::Base
  require 'sendgrid-ruby'
  include SendGrid

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook]
  
  has_many :discussions
  has_many :discussion_stars
  has_many :comments
  has_many :articles
  belongs_to :team

  after_create :after_creation_hook

  def after_creation_hook
    # Avoid sending email in test mode
    if self.email == 'user@user.com' or self.email == 'otheruser@user.com'
      return
    end
    from = Email.new(email: 'tulimiero.andrea@gmail.com')
    to = Email.new(email: self.email)
    subject = 'Thank you for registering to Overtime'
    content = Content.new(type: 'text/plain', value: 'We are pleased to have you with us!')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    p 'Sent email to ' + self.email + ' with code: ' + response.status_code
    # TODO: Handle response error
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first 
    if !user.nil?
      return user
    end 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
