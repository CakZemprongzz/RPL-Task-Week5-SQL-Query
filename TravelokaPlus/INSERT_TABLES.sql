USE TRAVELOKA_PLUS;

-- Inserting data into the Tourist table
INSERT INTO Tourist (Tourist_ID, Tourist_Name, Tourist_Email, Tourist_PhoneNumber) VALUES
(1,'Mama Yae', 'yaeee@email.com', '+1293120334'),
(2,'Papa Owo', 'uWu@email.com', '+123124354');

-- Inserting data into the Transportation table
INSERT INTO Transportation (TransportationID, Type, Departure, Arrival, Source, Destination, Available_Seat, Price) VALUES
(1,'Bus', '2023-11-10 08:00:00', '2023-11-10 12:00:00', 'City Mamamia ', 'City Liyue', 30, 20.00),
(2,'Plane', '2023-11-11 09:00:00', '2023-11-11 11:00:00', 'City Liyue', 'City Six', 100, 150.00);

-- Inserting data into the Hotel table
INSERT INTO Hotel (HotelID,HotelName, HotelLocation, Available_Room, Rating, Room_Type, HotelPrice_PerNight) VALUES
(1,'Inazuma Hotel', 'City Liyue', 20, 4.5, 'Big Mac', 50.00),
(2,'Blue Hotel', 'City Six', 15, 4.0, 'Standard', 40.00);

-- Inserting data into the TouristAttraction table
INSERT INTO TouristAttraction (AttractionID,TouristAttraction_Name, TouristAttraction_Location, Rating, Review, Price) VALUES
(1,'Museum Inazuma', 'City Liyue', 4.7, 'Great place to visit!', 10.00),
(2,'Park Huta', 'City Six', 4.5, 'Refreshing and peaceful.', 5.00);

-- Inserting data into the TravelAgent table
INSERT INTO TravelAgent (AgentID,AgentName, AgentPhoneNumber) VALUES
(1,'Agent Loid', '+9023400989'),
(2,'Agent Yor', '+09890890432');

-- Inserting data into the TourPackage table (assuming the FKs match the data inserted above)
INSERT INTO TourPackage (AgentID, AttractionID, HotelID, TransportationID, Details, Price) VALUES
(1, 1, 1, 1, '2 days 1 night in City Liyue with a visit to Museum Inazuma', 80.00),
(2, 2, 2, 2, '3 days 2 nights in City Six with a visit to Park Huta', 185.00);

-- Inserting data into the Order table (assuming the FKs match the data inserted above)
INSERT INTO `Order` (Tourist_ID, TransportID, HotelID, AttractionID, PackageID, Booking_Date, TotalPrice) VALUES
(1, 1, 1, 1, 1, '2023-10-25', 100.00),
(2, 2, 2, 2, 2, '2023-10-26', 235.00);
