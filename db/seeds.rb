user1 = User.create!(first_name: "John", last_name: "Doe", phone_number: nil, email: "john.doe@example.com", emergency_contact_name: nil, emergency_contact_phone_number: nil, google_uid: "1235456789")
user2 = User.create!(first_name: "Judy", last_name: "Doe", phone_number: nil, email: "judy.doe@example.com", emergency_contact_name: nil, emergency_contact_phone_number: nil, google_uid: "1235456799")

trip1 = Trip.create!(name: "Trippin", city: "Murfreesboro", country: "United States", postcode: "37128", place_id: "51a61cdd52189955c0597a8f8e064bec4140f00101f9011102030000000000c00208", start_date: "2023-03-01", end_date: "2023-03-08", image_url: "https://live.staticflickr.com/65535/51328655264_19b4724735_w.jpg")
trip2 = Trip.create!(name: "Hen Do", city: "Cabo", country: "Mexico", postcode: "00123", place_id: "518120e5cc1b8441c0594f07b29e5a9120c0f00101f90188a2040000000000c00208", start_date: "2023-04-01", end_date: "2023-04-10", image_url: "https://live.staticflickr.com/65535/5716766064_64559491a3_w.jpg")
trip3 = Trip.create!(name: "Stag Do", city: "Cabo", country: "Mexico", postcode: "00123", place_id: "518120e5cc1b8441c0594f07b29e5a9120c0f00101f90188a2040000000000c00208", start_date: "2023-05-01", end_date: "2023-05-10", image_url: "https://live.staticflickr.com/65535/5716766064_64559491a3_w.jpg")

#resturants
event1 = Event.create!(trip_id: trip1.id, event_date: nil, event_time: nil, event_id: "516f5dbe70fc9955c0597a484b8be1ed4140f00102f90148bbc1110000000092030644656d6f7327", votes: nil, confirmed: false, name: "Demos'", address: "1115 Northwest Broad Street, Murfreesboro, TN 37129, United States of America", category: "restaurant")
event2 = Event.create!(trip_id: trip1.id, event_date: nil, event_time: nil, event_id: "51521580e9839655c0594eccdf61cbea4140f00102f901590b86250000000092030843756c7665722773", votes: nil, confirmed: false, name: "Culver's", address: "2993 South Rutherford Boulevard, Murfreesboro, TN 37130, United States of America", category: "restaurant")
#attractions
event3 = Event.create!(trip_id: trip1.id, event_date: nil, event_time: nil, event_id: "515a2ed10f599b55c0594006245d33f04140f00103f901ea8da7dd0000000092031848617a656e27732042726967616465204d6f6e756d656e74", votes: nil, confirmed: false, name: "Hazen's Brigade Monument", address: "Old Nashville Highway, Murfreesboro, TN 37167, United States of America", category: "attraction")
event4 = Event.create!(trip_id: trip1.id, event_date: nil, event_time: nil, event_id: "51fb255d85509c55c059cb278093d8eb4140f00102f901e4c69f2000000000920310526964656f75742043656d6574657279", votes: nil, confirmed: false, name: "Rideout Cemetery", address: "Murfreesboro, TN, United States of America", category: "attraction")

flight1 = Flight.create!(user_id: user1.id, flight_number: "SW123", date: "2023-03-01 00:00:00")
flight2 = Flight.create!(user_id: user2.id, flight_number: "SW345", date: "2023-04-01 00:00:00")

tripattendee1 = TripAttendee.create!(user_id: user1.id, trip_id: trip1.id, status: "accepted")
tripattendee2 = TripAttendee.create!(user_id: user1.id, trip_id: trip3.id, status: "pending")