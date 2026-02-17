module EdenUi
  class StyleguideController < ActionController::Base
    layout "eden_ui/styleguide"

    before_action :ensure_enabled

    def index
      @categories = Styleguide::Registry.categories
      @component_count = Styleguide::Registry.component_count
      @layouts = Styleguide::Registry.layouts
    end

    def category
      @category_slug = params[:category].to_sym
      @category = Styleguide::Registry.find_category(@category_slug)

      unless @category
        redirect_to eden_ui.root_path
        return
      end

      @categories = Styleguide::Registry.categories
    end

    def show
      @category_slug = params[:category].to_sym
      @component_slug = params[:component]
      @category = Styleguide::Registry.find_category(@category_slug)
      @component = Styleguide::Registry.find_component(@category_slug, @component_slug)

      unless @category && @component
        redirect_to eden_ui.root_path
        return
      end

      @categories = Styleguide::Registry.categories
    end

    def blocks_index
      @block_categories = Styleguide::BlockRegistry.categories
      @block_count = Styleguide::BlockRegistry.block_count
      @categories = Styleguide::Registry.categories
    end

    def blocks_category
      @block_category_slug = params[:block_category].to_sym
      @block_category = Styleguide::BlockRegistry.find_category(@block_category_slug)

      unless @block_category
        redirect_to eden_ui.root_path
        return
      end

      @block_categories = Styleguide::BlockRegistry.categories
      @categories = Styleguide::Registry.categories
    end

    def blocks_show
      @block_category_slug = params[:block_category].to_sym
      @block_slug = params[:block]
      @block_category = Styleguide::BlockRegistry.find_category(@block_category_slug)
      @block = Styleguide::BlockRegistry.find_block(@block_category_slug, @block_slug)

      unless @block_category && @block
        redirect_to eden_ui.root_path
        return
      end

      @block_categories = Styleguide::BlockRegistry.categories
      @categories = Styleguide::Registry.categories
    end

    def blocks_preview
      @block_category_slug = params[:block_category].to_sym
      @block_slug = params[:block]
      @block_category = Styleguide::BlockRegistry.find_category(@block_category_slug)
      @block = Styleguide::BlockRegistry.find_block(@block_category_slug, @block_slug)

      unless @block_category && @block
        redirect_to eden_ui.root_path
        return
      end

      render layout: false
    end

    def layout_preview
      @layout_name = params[:layout]
      @layouts = Styleguide::Registry.layouts

      unless @layouts.key?(@layout_name.to_sym)
        redirect_to eden_ui.root_path
        return
      end

      render layout: false
    end

    private

    def ensure_enabled
      head :not_found unless EdenUi.configuration.styleguide_enabled
    end
  end
end
