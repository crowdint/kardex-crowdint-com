module BadgesEngine
  class Engine < ::Rails::Engine
    isolate_namespace BadgesEngine

    initializer :action_controller do
      ActiveSupport.on_load :action_controller do
        helper BadgesEngine::BaseHelper
      end
    end

    config.to_prepare do
      Rails.application.config.engines_list << 'BadgesEngine'
      Rails.application.config.rspec_paths << BadgesEngine::Engine.root

      Dir.glob(Rails.root + 'app/decorators/**/*_decorator').each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
