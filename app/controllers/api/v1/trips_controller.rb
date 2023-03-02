class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    trip = Trip.find(params[:id])
    options = {include: [:events]}
    render json: TripSerializer.new(trip, options)
  end

  def location_info
    @city_info = CityFacade.get_city_info(*location_params.values)

    @place_id = @city_info.place_id
    
    image = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
    @url = image.url
    create_events
  end
  
  def create_events
    restaurants = CityFacade.get_restaurant_info(@city_info.place_id)
    restaurants.each do |restaurant|
      Event.create!(trip_id: @trip.id, 
                    event_id: restaurant.place_id, 
                    name: restaurant.name, 
                    address: restaurant.address, 
                    category: 0)
    end

    attractions = CityFacade.get_tourist_attraction_info(@city_info.place_id)
    attractions.each do |attraction|
      Event.create!(trip_id: @trip.id, 
                    event_id: attraction.place_id, 
                    name: attraction.name, 
                    address: attraction.address, 
                    category: 1)
    end

  end
  def create
    user = User.find(params[:trip][:user_id])
    @trip = user.trips.create!(trip_params)
    location_info
    @trip.update!(place_id: @place_id, image_url: @url)
    render json: TripSerializer.new(@trip), status: :created
  end

  def update
    trip = Trip.find(params[:id])
    trip.update!(trip_params)
    render json: TripSerializer.new(trip)
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy!
  end

  private

  def trip_params
    params.require(:trip).permit(
                                  :name, 
                                  :city, 
                                  :country, 
                                  :postcode, 
                                  :start_date, 
                                  :end_date
                                 ).merge(
                                          place_id: @place_id, 
                                          image_url: @url
                                          )

  end

  def location_params
    params.require(:trip).permit(:city, :country, :postcode)
  end
end