class UserEmail < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email_address
  validates_uniqueness_of :email_address
end
