require "rspec/core/rake_task"

#RSpec::Core::RakeTask.new(:spec)

task :default => :spec

RSpec::Core::RakeTask.module_eval do
  def pattern
    extras = ['./spec{,/*/**}/*_spec.rb']
    Rails.application.config.rspec_paths.each do |dir|
      if File.directory?( dir )
        extras << ".#{dir.to_s.gsub(Rails.root.to_s, '')}/spec{,/*/**}/*_spec.rb"
      end
    end
    extras
  end
end
