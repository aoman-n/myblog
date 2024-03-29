require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myblog
  class Application < Rails::Application
     config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    I18n.config.available_locales = :ja
    I18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    I18n.enforce_available_locales = true
    # config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
