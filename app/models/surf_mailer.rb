class SurfMailer < ActionMailer::Base
  
  def payment_received(payment, sent_at = Time.now)
    @subject    = 'SurfMailer#payment_received'
    @recipients = payment.email
    @from       = 'ubcsurf@gmail.com'
    @sent_on    = sent_at
    # @body        = :greeting => 'Hi,'
  end

  def trip_enrollment_submitted(trip_enrollment, sent_at = Time.now)
    @subject    = "#{trip_enrollment.trip.title} - #{trip_enrollment.name} - Sign up"
    @recipients = trip_enrollment.email_address
    @bcc        = 'ubcsurfclub@gmail.com'
    @from       = 'ubcsurfclub@gmail.com'
    @sent_on    = sent_at
    @body       = {:trip => trip_enrollment.trip, :trip_enrollment => trip_enrollment}
  end

end
