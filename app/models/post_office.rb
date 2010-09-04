class PostOffice < ActionMailer::Base
  def waitlist_msg(user)
    subject  "Corporate Mixer: You're waitlisted."
    recipients  user.email
    from       'cmu.nsbe.cl@gmail.com'
    sent_on     Time.now
    body        :user => user
    content_type "text/html"
  end

  def registration_msg(user)
    subject  "Corporate Mixer: You're registered."
    recipients  user.email
    from       'cmu.nsbe.cl@gmail.com'
    sent_on     Time.now
    body        :user => user
    content_type "text/html"
  end
end
