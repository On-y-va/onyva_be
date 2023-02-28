class Api::V1::Users::UserTripsController < ApplicationController
  def index
    render json: TripSerializer.new(User.find(params[:user_id]).trips)
  end
  
  def update
    trip = User.find(params[:user_id]).trips.find(params[:id])
    trip.update!(user_trip_params)
    render json: TripSerializer.new(trip)
  end

  def create
    if params[:trip][:city] != "" && params[:trip][:country] != "" && params[:trip][:postcode] != ""
      city_info = CityFacade.get_city_info(params[:trip][:city], params[:trip][:country], params[:trip][:postcode])
      @restaurants = CityFacade.get_restaurant_info(city_info.place_id)
      @attractions = CityFacade.get_tourist_attraction_info(city_info.place_id)
      @place_id = city_info.place_id
      image = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
      @url = image.url
      trip = Trip.create!(user_trip_params)
      @restaurants.each do |restaurant|
        Event.create!(trip_id: trip.id, event_id: restaurant.place_id, name: restaurant.name, address: restaurant.address)
      end
      @attractions.each do |attraction|
        Event.create!(trip_id: trip.id, event_id: attraction.place_id, name: attraction.name, address: attraction.address)
      end
      user = User.find(params[:user_id])
      # user = User.find(1)
      TripAttendee.create!(user_id: user.id, trip_id: trip.id)
        
      # require 'pry'; binding.pry
      render json: TripSerializer.new(trip), status: :created
    else
      render json: ErrorSerializer.no_matches_found
    end
  end

  private

  def user_trip_params
    params.require(:trip).permit(:name, :city, :country, :postcode, :start_date, :end_date).merge(place_id: @place_id, image_url: @url)
  end

end