class SearchController < ApplicationController
  def index
    render locals: {
      map_info: MapFacade.new(params[:location]),
    }

    # route_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
    #   req.params['key'] = ENV['google_maps_key']
    #   req.params['origin'] = params['location']
    #   req.params['destination'] = nearest_station[:street_address]
    # end
    #
    # route_data = JSON.parse(route_response.body, symbolize_names: true)
    # route = route_data[:routes][0][:legs][0][:steps][0]
  end
end
