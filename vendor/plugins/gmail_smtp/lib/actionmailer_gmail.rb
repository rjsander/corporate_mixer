ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:authentication => :plain,
	:domain => 'cmu.nsbe.cl@gmail.com',
	:user_name => 'cmu.nsbe.cl@gmail.com',
	:password => 'nsbe2endzone'
}
