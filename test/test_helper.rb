$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "active_support"
require "active_support/core_ext/string/inquiry"

# Stub Rails for unit tests (eden_ui uses Rails.env in configuration defaults)
unless defined?(Rails)
  module Rails
    def self.env
      ActiveSupport::StringInquirer.new("test")
    end
  end
end

# Load only the parts we can test without a full Rails boot
require "eden_ui/version"
require "eden_ui/brand_presets"
require "eden_ui/configuration"

# Provide the EdenUi module API (configure/reset)
module EdenUi
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset_configuration!
      @configuration = Configuration.new
    end
  end
end unless EdenUi.respond_to?(:configure)

require "minitest/autorun"
