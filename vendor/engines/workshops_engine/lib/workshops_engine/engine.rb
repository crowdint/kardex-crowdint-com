module WorkshopsEngine
  class Engine < ::Rails::Engine
    isolate_namespace WorkshopsEngine

    initializer "workshops_engine.assets.precompile" do |app|
      app.config.assets.precompile += %w( workshops_engine/workshop.css workshops_engine/workshops.css
                                          workshops_engine/admin/admin-workshops.css
                                        )
    end

    initializer 'workshops_engine.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper WorkshopsEngine::BaseHelper
      end
    end

    config.to_prepare do
      Rails.application.config.engines_list << "WorkshopsEngine"

      Dir.glob(Rails.root + 'vendor/engines/workshops_engine/app/decorators/**/*_decorator.rb').each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.helper false
    end
  end
end
