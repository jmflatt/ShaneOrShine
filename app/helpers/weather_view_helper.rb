module WeatherViewHelper

  def self.resolve_forecast_for_partial(forecast)
    weather = resolve_weather(forecast[0])
    temp = resolve_temp(forecast[1])
    precip = resolve_precip(forecast[2])

    return 'rainy' if precip == 'probably currently'
    return 'hot' if temp == 'hot'
    weather
  end

  def self.resolve_weather(forecast)
    case forecast
    when 'Overcast'
      return 'cloudy'
    when /Cloud/
      return 'cloudy'
    when 'Clear'
      return 'sunny'
    when /rain/
      return 'rainy'
    else
      'generic_weather_shane'
    end
  end

  def self.resolve_temp(forecast)
    return 'very cold' if forecast < 32.0
    return 'chilly' if forecast > 32.0 && forecast <= 55.0
    return 'nice' if forecast > 55.0 && forecast <= 80.0
    'hot' if forecast > 80.0
  end

  def self.resolve_precip(forecast)
    return 'probably not' if forecast.to_f <= 30
    return 'fair chance' if forecast.to_f > 30 && forecast.to_f <= 60
    'probably currently' if forecast.to_f > 60
  end
end
