module FeedbookEngine
  class Engine < ::Rails::Engine
    isolate_namespace FeedbookEngine

    initializer 'workshops_engine.assets.precompile' do |app|
      app.config.assets.precompile += %w()
    end

    initializer :action_controller do
      ActiveSupport.on_load :action_controller do
        helper FeedbookEngine::BaseHelper
      end
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end

    config.to_prepare do
      Rails.application.config.engines_list << 'FeedbookEngine'
      Rails.application.config.rspec_paths << FeedbookEngine::Engine.root

      path = Rails.root + 'vendor/engines/feedbook_engine/app/decorators/**/*_decorator.rb'
      Dir.glob(path).each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.helper false
    end
  end
end
