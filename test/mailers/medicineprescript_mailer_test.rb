require "test_helper"

class MedicineprescriptMailerTest < ActionMailer::TestCase
  test "send_medicine_prescript" do
    mail = MedicineprescriptMailer.send_medicine_prescript
    assert_equal "Send medicine prescript", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
