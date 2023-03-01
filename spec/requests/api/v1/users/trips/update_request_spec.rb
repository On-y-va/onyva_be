# require 'rails_helper'

# describe 'Users trips update API' do
#   describe 'PATCH users/:user_id/trips/:id' do
#     context 'if the trip is successfully updated' do
#       it 'updates the trip' do
#         user = create(:user)
#         trip = create(:trip, name: 'initial trip name')
#         ta = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

#         previous_trip_name = Trip.last.name
#         trip_params = { name: "Updated Trip" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})

#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to be_successful
#         expect(trip.name).to eq("Updated Trip")
#         expect(trip.name).to_not eq(previous_trip_name)
#       end
#     end

#     context 'if the trip is not updated successfully' do
#       it 'fails if to update if trip name is left blank' do
#         user = create(:user)
#         trip = create(:trip, name: 'Updated Trip')
#         ta = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

#         previous_trip_name = Trip.last.name
#         trip_params = { name: "" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to_not be_successful
#         expect(response.status).to eq(400)
#         expect(trip.name).to eq(previous_trip_name)
#         expect(trip.name).to eq("Updated Trip")

#         expect(response_body[:error]).to match("Validation failed: Name can't be blank")
#       end

#       it 'fails if to update if trip city is left blank' do
#         user = create(:user)
#         trip = create(:trip, city: 'Updated Trip')
#         ta = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

#         previous_trip_city = Trip.last.city
#         trip_params = { city: "" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to_not be_successful
#         expect(response.status).to eq(400)
#         expect(trip.city).to eq(previous_trip_city)
#         expect(trip.city).to eq("Updated Trip")

#         expect(response_body[:error]).to match("Validation failed: City can't be blank")
#         previous_trip_city = Trip.last.city
#         trip_params = { city: "" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to_not be_successful
#         expect(response.status).to eq(400)
#         expect(trip.city).to eq(previous_trip_city)
#         expect(trip.city).to eq("Updated Trip")

#         expect(response_body[:error]).to match("Validation failed: City can't be blank")
#       end

#       it 'fails if to update if trip country is left blank' do
#         user = create(:user)
#         trip = create(:trip, country: 'Updated Trip')
#         ta = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

#         previous_trip_country = Trip.last.country
#         trip_params = { country: "" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to_not be_successful
#         expect(response.status).to eq(400)
#         expect(trip.country).to eq(previous_trip_country)
#         expect(trip.country).to eq("Updated Trip")

#         expect(response_body[:error]).to match("Validation failed: Country can't be blank")
#       end

#       it 'fails if to update if trip name is left blank' do
#         user = create(:user)
#         trip = create(:trip, postcode: 'Updated Trip')
#         ta = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

#         previous_trip_postcode = Trip.last.postcode
#         trip_params = { postcode: "" }
#         headers = { "CONTENT_TYPE" => "application/json" }

#         patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
#         response_body = JSON.parse(response.body, symbolize_names: true)
#         trip = Trip.find_by(id: trip.id)

#         expect(response).to_not be_successful
#         expect(response.status).to eq(400)
#         expect(trip.postcode).to eq(previous_trip_postcode)
#         expect(trip.postcode).to eq("Updated Trip")

#         expect(response_body[:error]).to match("Validation failed: Postcode can't be blank")
#       end
#     end
#   end
# end