EdenUi::Engine.routes.draw do
  constraints ->(_req) { EdenUi.configuration.styleguide_enabled } do
    root to: "styleguide#index"
    get "layouts/:layout", to: "styleguide#layout_preview", as: :styleguide_layout

    # Block routes (must come before catch-all :category routes)
    get "blocks", to: "styleguide#blocks_index", as: :styleguide_blocks
    get "blocks/:block_category", to: "styleguide#blocks_category", as: :styleguide_block_category
    get "blocks/:block_category/:block", to: "styleguide#blocks_show", as: :styleguide_block
    get "blocks/:block_category/:block/preview", to: "styleguide#blocks_preview", as: :styleguide_block_preview

    # Catch-all component routes (must be last)
    get ":category", to: "styleguide#category", as: :styleguide_category
    get ":category/:component", to: "styleguide#show", as: :styleguide_component
  end
end
