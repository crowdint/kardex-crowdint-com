module WorkshopsEngine
  class Engine < ::Rails::Engine
    # isolate_namespace WorkshopsEngine

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
