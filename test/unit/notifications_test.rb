require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "signup" do
    @expected.subject = 'Notifications#signup'
    @expected.body    = read_fixture('signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_signup(@expected.date).encoded
  end

end
