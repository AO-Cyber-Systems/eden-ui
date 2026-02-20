require "eden_ui/version"
require "eden_ui/brand_presets"
require "eden_ui/configuration"
require "eden_ui/form_builder"
require "eden_ui/styleguide/registry"
require "eden_ui/styleguide/block_registry"
require "eden_ui/engine"

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
end
