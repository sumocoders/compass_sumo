module CompassSumo::SassExtensions::Functions::Random
  def random number
    Sass::Script::Number.new(rand(number.value).to_i)
  end
