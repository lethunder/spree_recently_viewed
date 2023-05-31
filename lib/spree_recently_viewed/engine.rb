require_relative 'configuration'

module SpreeRecentlyViewed
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_recently_viewed'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'recently_viewed.environment', before: :load_config_initializers do |_app|
      SpreeRecentlyViewed::Config = SpreeRecentlyViewed::Configuration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
