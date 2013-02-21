require 'compass'

module CompassSumo
end

if defined?(::Rails) && ::Rails.version >= "3.1"
  require 'compass_sumo/engine'
end

require 'compass_sumo/sass_extensions/functions'

Compass::Frameworks.register("sumo", :path => "#{File.dirname(__FILE__)}/..")
