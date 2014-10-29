module CompassSumo::SassExtensions
  module Functions
  end
end

require 'compass_sumo/sass_extensions/functions/inline_svg'
require 'compass_sumo/sass_extensions/functions/random'

module Sass::Script::Functions
  include CompassSumo::SassExtensions::Functions::InlineSvg
  include CompassSumo::SassExtensions::Functions::Random
end

class Sass::Script::Functions::EvaluationContext
  include Sass::Script::Functions
end
