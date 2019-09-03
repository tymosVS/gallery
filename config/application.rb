# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'recaptcha/rails'
require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gallery
  class Application < Rails::Application
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = false
    # config.active_job.queue_adapter = :resque
  end
end
