class UserRegistration < Presenter

  delegate_attributes :user, :attributes => [:first_name, :last_name, :password]
  delegate_attributes :user_email, :attributes => [:email_address]

  def user
    @user ||= User.new(:joined_at => Time.now)
  end

  def user_email
    @user_email ||= user.user_emails.build(:is_primary => true)
  end

  protected

  def validate
    user.valid? && user_email.valid?
  end

  def save_delegates
    User.transaction do
      user.save!
      user_email.save!
      Notifications.deliver_signup(user)
    end 
  end

end
