class Article < ActiveRecord::Base
    require 'sendgrid-ruby'
    include SendGrid
    include Rails.application.routes.url_helpers

    validates :title, presence: true,
                    length: { minimum: 5 }
    belongs_to :user
    belongs_to :team
    
    after_create :after_creation_hook

    def after_creation_hook
        if self.team.nil?
            return
        end
        
        mail = Mail.new
        mail.from = Email.new(email: 'tulimiero.andrea@gmail.com')
        
        personalization = Personalization.new
        personalization.subject = 'A new article about ' + self.team.name + ' is out!'
        self.team.users.each do |u|
            p 'Adding ' + u.email
            personalization.add_to(Email.new(email: u.email))
        end
        mail.add_personalization(personalization)
        host = 'http://localhost:3000'
        path = '/articles/' + self.id.to_s
        msg = 'Check it out <a href="' + host + path + '">here</a>' 
        mail.add_content(Content.new(type: 'text/html', value: msg))

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        p 'Sent email to  with code: ' + response.body
        # TODO: Handle response error
    end
end
