require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'amazon/ecs'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookblog
  class Application < Rails::Application

Amazon::Ecs.options = {
  :AWS_access_key_id => "AKIAIXOA2MM3UKO5RXWQ",
  :AWS_secret_key => "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",
  :associate_tag => "asa518649-22",
  :country => :jp
}

    
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
