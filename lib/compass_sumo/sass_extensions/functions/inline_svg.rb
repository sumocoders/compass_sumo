require 'uri'

module CompassSumo::SassExtensions::Functions::InlineSvg
  def inline_svg(path)
    data = svg_content(path.value)
    data = URI.escape(data, '()#') # URL escape breaking characters
              .split(/[\r\n]+/)    # Get rid of newlines in the URL
              .join.gsub(/\t/, '') # Get rid of tabs.

    url = "url('data:image/svg+xml;utf-8,#{data}')"
    Sass::Script::String.new(url)
  end

  private
  def svg_content(path)
    full_path = File.join(Compass.configuration.images_path, path)
    if File.readable?(full_path)
      File.read(full_path)
    else
      raise Compass::Error, "File not found or cannot be read: #{full_path}"
    end
  end
end
