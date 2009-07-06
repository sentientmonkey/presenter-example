class UserEmail < ActiveRecord::Base
  belongs_to :user

  named_scope :primary, :conditions => {:is_primary => true}
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
end
