# Tell cache digests to parse haml view templates
# when calculating cache keys for view fragments

ActiveSupport.on_load(:action_view) do
  ActiveSupport.on_load(:after_initialize) do
    require 'action_view/dependency_tracker'
    ActionView::DependencyTracker.register_tracker :haml, ActionView::DependencyTracker::ERBTracker

    if Rails.env.development?
      # recalculate cache digest keys for each request

      # using blackhole cache until code is released to allow us to get this behavior
      # by simply setting `config.cache_template_loading` false in development.rb
      # https://github.com/rails/rails/pull/10791
      class BlackHole < Hash
        def []=(*); end
      end
      module ::ActionView
        class Digestor
          @@cache = BlackHole.new
        end
      end
    end
  end
end