# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'fog/aws'
require 'recaptcha/rails'
require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gallery
  class Application < Rails::Application
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = true
    config.serve_static_assets = true

    # config.active_job.queue_adapter = :resque
  end
end
