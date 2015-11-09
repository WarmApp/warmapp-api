require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Warmapp
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '**/')]
    config.active_record.raise_in_transactional_callbacks = true
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 30.minutes }
  end
end
