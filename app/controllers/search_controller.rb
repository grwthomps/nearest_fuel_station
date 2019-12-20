class SearchController < ApplicationController
  def index
  station_response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |req|
    req.params['api_key'] = ENV['nrel_key']
    req.params['fuel_type'] = ENV['ELEC']
    req.params['location'] = '1331+17th+St+Denver+CO'
    req.params['limit'] = 1
  end

  station_data = JSON.parse(response.body, symbolize_names: true)
  nearest_station = data[:fuel_stations][0]
  binding.pry
  end
end
