class Api::V1::Trips::EventsController < ApplicationController  
  def index
    trip = Trip.find(params[:id])
    city = CityFacade.get_city_info(trip.city, trip.country, trip.postcode)
    trip_events = CityFacade.get_restaurant(city.place_id)
  end
end