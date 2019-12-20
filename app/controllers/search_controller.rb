class SearchController < ApplicationController
  def index
  station_response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |req|
    req.params['api_key'] = ENV['nrel_key']
    req.params['fuel_type'] = ENV['ELEC']
    req.params['location'] = params['location']
    req.params['limit'] = 1
  end

  station_data = JSON.parse(station_response.body, symbolize_names: true)
  nearest_station = station_data[:fuel_stations][0]

  route_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
    req.params['key'] = ENV['google_maps_key']
    req.params['origin'] = params['location']
    req.params['destination'] = nearest_station[:street_address]
  end

  route_data = JSON.parse(route_response.body, symbolize_names: true)
  route = route_data[:routes][0][:legs][0][:steps][0]
  binding.pry
  end
end
