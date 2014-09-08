# This importer adds a simple way to load fonts like you can import sprites
#
# In your .scss file, just add the following line to import all fonts in your font directory
#   @import "fonts:*";
#
# You can also import your fonts more selectively by changing the glob:
#   @import "fonts:Museo/*";
#
# This will read the name of the font from the TTF file, and make it available as a variable.
# It will also load the font. The variable name gets downcase.
#
# So if you have a font named MuseoSlab-500, the variable will be named $museoslab-500
#
# WARNING: This works by reading TTF files from your fonts folder.
# If you're not working with TTF, this won't work for you
class CompassSumo::SassExtensions::Importers::FontImporter < Sass::Importers::Base
  SCHEME = /^fonts:/
  CONTENT_TEMPLATE_FILE = File.join(File.expand_path('../', __FILE__), 'font_importer', 'template.erb')
  CONTENT_TEMPLATE = ERB.new(File.read(CONTENT_TEMPLATE_FILE))

  def find(uri, options)
    if uri =~ SCHEME
      options = {
	:syntax => :scss,
	:filename => uri,
	:importer => self
      }

      # Abuse Compass's Sprites Binding
      binder = Compass::Sprites::Binding.new(:fonts => font_information_for(uri, options))
      content = CONTENT_TEMPLATE.result(binder.get_binding)

      return Sass::Engine.new(content, options)
    end

    nil
  end

  def to_s
    self.class.name
  end

  def hash
    self.class.name.hash
  end

  def key(uri, options = {})
    [self.class.name + ':font:' + uri, uri]
  end

  def mtime(uri, options)
    font_files_for(uri).inject(Time.at(0)) do |max_time, file|
      (t = File.mtime(file)) > max_time ? t : max_time
    end
  end

  def font_information_for(uri, options = {})
    font_files_for(uri, options).map do |file|
      {
        :font_variable => File.basename(file).gsub('.ttf', ''),
        :path      => file.gsub(Compass.configuration.fonts_dir + '/', '').gsub('.ttf', ''),
      }
    end
  end

  def font_files_for(uri, options = {})
    glob = uri.gsub(SCHEME, '')
    font_path = Compass.configuration.fonts_dir

    fonts = Dir[File.join(font_path, "#{glob}.ttf")].sort

    raise Compass::Error, "No TTF files were found in the load path matching '#{glob}' in #{font_path}" if fonts.empty?

    fonts
  end
end
