CREATE DATABASE IF NOT EXISTS FisheryAnalytics;
USE FisheryAnalytics;

CREATE TABLE Vessels (
    VesselID VARCHAR(10) PRIMARY KEY,
    VesselName VARCHAR(50),
    Captain VARCHAR(50)
);

CREATE TABLE Buyers (
    BuyerID VARCHAR(10) PRIMARY KEY,
    BuyerName VARCHAR(50),
    Company VARCHAR(50)
);

CREATE TABLE CatchLogs (
    CatchID INT AUTO_INCREMENT PRIMARY KEY,
    CatchDate DATE,
    VesselID VARCHAR(10),
    FishType VARCHAR(30),
    WeightKG DECIMAL(10, 2),
    FOREIGN KEY (VesselID) REFERENCES Vessels(VesselID)
);

CREATE TABLE MarketPrices (
    MarketDate DATE,
    FishType VARCHAR(30),
    MarketPricePerKG DECIMAL(10, 2),
    PRIMARY KEY (MarketDate, FishType)
);

CREATE TABLE VesselPerformance (
    VesselID VARCHAR(10) PRIMARY KEY,
    FuelUsed DECIMAL(10, 2),
    TripsMade INT,
    CatchPerTrip DECIMAL(10, 2),
    FOREIGN KEY (VesselID) REFERENCES Vessels(VesselID)
);

CREATE TABLE FishTypes (
    FishType VARCHAR(30) PRIMARY KEY
);

INSERT INTO FishTypes (FishType)
SELECT DISTINCT FishType
FROM auctionprices
WHERE FishType NOT IN (SELECT FishType FROM FishTypes);

ALTER TABLE auctionprices
ADD CONSTRAINT fk_fishtype_auction
FOREIGN KEY (FishType) REFERENCES FishTypes(FishType);

ALTER TABLE marketprices
ADD CONSTRAINT fk_fishtype_market
FOREIGN KEY (FishType) REFERENCES FishTypes(FishType);


