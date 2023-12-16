require "test_helper"

class AppointmentMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = AppointmentMailer.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
