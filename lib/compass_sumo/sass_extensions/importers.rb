module CompassSumo::SassExtensions
  module Importers
  end
end

require 'compass_sumo/sass_extensions/importers/font_importer'

Sass.load_paths << CompassSumo::SassExtensions::Importers::FontImporter.new
