source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'webdrivers'
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails', '~> 3.8'
  gem "factory_bot"
  gem 'database_cleaner', '~> 1.7'
  gem 'rails-controller-testing'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'carrierwave', '>= 2.0.0', '< 3.0'
# dependency for carrierwave
gem "mini_magick"
gem 'file_validators'

gem "haml-rails", "~> 2.0"
# dependency for haml
gem "erubis", ">=2.7.0"

gem 'devise'

gem 'friendly_id', '~> 5.2'

# gem 'activeadmin'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'autoprefixer-rails'
gem 'activeadmin', '~> 2.2'
gem 'active_bootstrap_skin'


gem 'kaminari'

gem 'jquery-rails'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'



gem "recaptcha", require: "recaptcha/rails"

gem 'resque', '~> 2.0'

gem 'nokogiri', '~> 1.10'

gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'
gem 'devise-bootstrap-views', '~> 1.0'

gem 'rubocop', '~> 0.74.0'

gem 'aws-sdk', '~> 2'

gem "fog-aws"

gem 'figaro'
gem 'capistrano'
gem 'capistrano-bundler'
gem 'capistrano-passenger', '>= 0.1.1'
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'capistrano-figaro-yml', '~> 1.0.2'
