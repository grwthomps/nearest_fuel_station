class NrelService
  def fetch_electric_stations(location)
    response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['api_key'] = ENV['nrel_key']
      req.params['fuel_type'] = 'ELEC'
      req.params['location'] = location
      req.params['limit'] = 1
    end
    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
