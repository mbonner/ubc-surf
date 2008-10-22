require 'test_helper'

class SurfMailerTest < ActionMailer::TestCase
  tests SurfMailer
  def test_payment_received
    @expected.subject = 'SurfMailer#payment_received'
    @expected.body    = read_fixture('payment_received')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SurfMailer.create_payment_received(@expected.date).encoded
  end

  def test_trip_enrollment_submitted
    @expected.subject = 'SurfMailer#trip_enrollment_submitted'
    @expected.body    = read_fixture('trip_enrollment_submitted')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SurfMailer.create_trip_enrollment_submitted(@expected.date).encoded
  end

end
