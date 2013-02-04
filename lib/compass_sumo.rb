require 'compass'

if defined?(::Rails) && ::Rails.version >= "3.1"
  require 'compass_sumo/engine'
end

Compass::Frameworks.register("sumo", :path => "#{File.dirname(__FILE__)}/..")

module CompassSumo
end
