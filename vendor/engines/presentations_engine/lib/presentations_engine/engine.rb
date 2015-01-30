module PresentationsEngine
  class Engine < ::Rails::Engine
    isolate_namespace PresentationsEngine

    config.to_prepare do
      Dir.glob(Rails.root + 'app/decorators/**/*_decorator.rb').each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.helper false
    end
  end
end
