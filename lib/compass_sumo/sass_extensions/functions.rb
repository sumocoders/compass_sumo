module CompassSumo::SassExtensions
  module Functions
  end
end

require 'compass_sumo/sass_extensions/functions/inline_svg'

module Sass::Script::Functions
  include CompassSumo::SassExtensions::Functions::InlineSvg
end

class Sass::Script::Functions::EvaluationContext
  include Sass::Script::Functions
end
