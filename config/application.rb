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
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.serve_static_assets = true
    # config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # config.active_job.queue_adapter = :resque
    config.assets.paths << "#{Rails.root}/app/assets/fonts"

  end
end
