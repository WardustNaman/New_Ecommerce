ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:authentication => "plain",
	:enable_starttls_auto => true,
	:user_name => "2018readyecommerce@gmail.com",
	:password => "ecommerce@1234",
	:openssl_verify_mode => 'none'
}