module WeatherHelper
  CONNECTION = Faraday.new url: 'http://api.wunderground.com' do |connection|
    connection.response :json, content_type: /\bjson$/
    connection.adapter Faraday.default_adapter
  end

  WEATHER_UNDERGROUND_API_KEY = '1cab5ad967554413'

  def self.conditions(state, city)
    raise 'No API Key set for Weather Underground' if WEATHER_UNDERGROUND_API_KEY.nil?
    url = "/api/#{WEATHER_UNDERGROUND_API_KEY}/conditions/q/#{ state }/#{ city }.json"
    consume(CONNECTION.get(url).body)
  end

  def self.consume(body)
    get_condition_temp_precip(body)
  end

  def self.get_condition_temp_precip(body)
    [body['current_observation']['weather'], body['current_observation']['temp_f'], body['current_observation']['precip_today_metric']]
  end
end
