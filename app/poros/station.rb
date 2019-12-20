class Station
  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(nearest_station_data)
    @name = nearest_station_data[:fuel_stations][0][:station_name]
    @address = nearest_station_data[:fuel_stations][0][:street_address]
    @fuel_type = nearest_station_data[:fuel_stations][0][:fuel_type_code]
    @access_times = nearest_station_data[:fuel_stations][0][:access_days_time]
  end
end
