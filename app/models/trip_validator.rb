class TripValidator < ActiveModel::Validator
  
  def validate(trip)
    if trip.end_date && trip.start_date
      if trip.end_date < trip.start_date 
        trip.errors.add :end_date, "must be after start date"
      end
    end
  end
end