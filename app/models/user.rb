class User < ActiveRecord::Base
  has_many :user_emails

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :password, :on => :create
  validates_length_of :password, :allow_blank => true, :in => 6..12

  before_save :encrypt_password_before_save

  attr_accessor :password

  def primary_email
    user_emails.primary.first
  end

  private

  def encrypt_password_before_save
    unless self.password.blank?
      self.salt = Digest::SHA256.hexdigest("--#{Time.now.to_s}--#{self.first_name}--#{self.last_name}")
      self.encrypted_password = encrypt(self.password, self.salt)
    end
  end

  def encrypt(password, salt)
    Digest::SHA256.hexdigest("--#{salt}--#{password}--")
  end

end
