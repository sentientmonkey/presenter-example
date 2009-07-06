class Notifications < ActionMailer::Base
  

  def signup(user, sent_at = Time.now)
    subject    'Welcome new user'
    recipients "#{user.first_name}, #{user.last_name} <#{user.primary_email.email_address}>"
    from       'Presenter App <app@example.com>'
    sent_on    sent_at
    body       :user => user
  end

end
