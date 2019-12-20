class MapFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def closest_electric_station
    service = NrelService.new
    nearest_station_data ||= service.fetch_electric_stations(@location)
    Station.new(nearest_station_data)
  end
end
