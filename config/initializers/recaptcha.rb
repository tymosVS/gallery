Recaptcha.configure do |config| 
  config.site_key  = ENV['CAPTCHA_PUBLIC_KEY']
  config.secret_key = ENV['CAPTCHA_PRIVATE_KEY']
end