module Refinery
  module Galleries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Galleries

      engine_name :refinery_galleries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "items"
          plugin.hide_from_menu = true
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.galleries_admin_items_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/galleries/item'
          }
          plugin.menu_match = %r{refinery/galleries/items(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::GalleryItems)
      end
    end
  end
end
