CREATE DATABASE TRAVELOKA_PLUS;
USE TRAVELOKA_PLUS;

-- Tourist Table
CREATE TABLE Tourist (
    Tourist_ID INT AUTO_INCREMENT PRIMARY KEY,
    Tourist_Name VARCHAR(255) NOT NULL,
    Tourist_Email VARCHAR(255) UNIQUE NOT NULL,
    Tourist_PhoneNumber VARCHAR(15) UNIQUE
);

-- Transportation Table
CREATE TABLE Transportation (
    TransportationID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Departure DATETIME NOT NULL,
    Arrival DATETIME NOT NULL,
    Source VARCHAR(255) NOT NULL,
    Destination VARCHAR(255) NOT NULL,
    Available_Seat INT DEFAULT 0,
    Price DECIMAL(10, 2) NOT NULL
);

-- Hotel Table
CREATE TABLE Hotel (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    HotelName VARCHAR(255) NOT NULL,
    HotelLocation VARCHAR(255) NOT NULL,
    Available_Room INT DEFAULT 0,
    Rating DECIMAL(3, 2) DEFAULT 0,
    Room_Type VARCHAR(50) NOT NULL,
    HotelPrice_PerNight DECIMAL(10, 2) NOT NULL
);

-- Tourist Attraction Table
CREATE TABLE TouristAttraction (
    AttractionID INT AUTO_INCREMENT PRIMARY KEY,
    TouristAttraction_Name VARCHAR(255) NOT NULL,
    TouristAttraction_Location VARCHAR(255) NOT NULL,
    Rating DECIMAL(3, 2) DEFAULT 0,
    Review TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Travel Agent Table
CREATE TABLE TravelAgent (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    AgentName VARCHAR(255) NOT NULL,
    AgentPhoneNumber VARCHAR(15) UNIQUE NOT NULL
);

-- Tour Package Table
CREATE TABLE TourPackage (
    PackageID INT AUTO_INCREMENT PRIMARY KEY,
    AgentID INT,
    AttractionID INT,
    HotelID INT,
    TransportationID INT,
    Details TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (AgentID) REFERENCES TravelAgent(AgentID),
    FOREIGN KEY (AttractionID) REFERENCES TouristAttraction(AttractionID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
    FOREIGN KEY (TransportationID) REFERENCES Transportation(TransportationID)
);

-- Order Table
CREATE TABLE `Order` (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    Tourist_ID INT,
    TransportID INT,
    HotelID INT,
    AttractionID INT,
    PackageID INT,
    Booking_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
    FOREIGN KEY (TransportID) REFERENCES Transportation(TransportationID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID)
);

-- Adding Indexes
CREATE INDEX idx_hotel_location ON Hotel(HotelLocation);
CREATE INDEX idx_transportation_type ON Transportation(Type);
CREATE INDEX idx_attraction_name ON TouristAttraction(TouristAttraction_Name);
