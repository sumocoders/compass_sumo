task :release => :build do
  %x(
    gem push pkg/compass_sumo-#{current_version}.gem
  )
end

task :build do
  %x(
    gem build compass_sumo.gemspec &&
    mv compass_sumo-#{current_version}.gem pkg/
  )
end

namespace :version do
  namespace :bump do
    task :minor do
      version = current_version_info
      version[:minor] += 1
      write_version(version)
    end

    task :major do
      version = current_version_info
      version[:major] += 1
      write_version(version)
    end

    task :patch do
      version = current_version_info
      version[:patch] += 1
      write_version(version)
    end
  end
end

def current_version
  unless Kernel.const_defined?('Sumodev') && Sumodev.const_defined?('VERSION')
    load File.join(File.dirname(__FILE__), 'lib/compass_sumo/version.rb')
  end

  CompassSumo::VERSION
end

def current_version_info
  match = current_version.match(/(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)/)
  match.names.inject({}) do |result, name|
    result.merge name.to_sym => match[name].to_i
  end
end

def write_version(v)
  File.open(File.join(File.dirname(__FILE__), 'lib/compass_sumo/version.rb'), 'w') do |f|
    f.write <<-MODULE
module CompassSumo
  VERSION = "#{v[:major]}.#{v[:minor]}.#{v[:patch]}"
end
    MODULE
  end
end