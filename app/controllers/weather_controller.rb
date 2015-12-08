class WeatherController < ApplicationController


  def index
    @forecast = WeatherHelper.conditions('OH', 'Cincinnati')
    @partial = WeatherViewHelper.resolve_forecast_for_partial(@forecast)
    binding.pry
  end
end
