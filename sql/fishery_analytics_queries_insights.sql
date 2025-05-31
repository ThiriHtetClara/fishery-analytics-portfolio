USE fisheryanalytics;

-- 1. Daily summary of total catch and auction sales
SELECT 
    c.CatchDate,
    c.FishType,
    ROUND(SUM(c.WeightKG), 2) AS TotalCatchKG,
    ROUND(AVG(a.PricePerKG), 2) AS AvgAuctionPrice
FROM CatchLogs c
JOIN AuctionPrices a ON c.CatchDate = a.AuctionDate AND c.FishType = a.FishType
GROUP BY c.CatchDate, c.FishType
ORDER BY c.CatchDate;

-- 2. Monthly average auction price per fish type
SELECT 
    MONTH(AuctionDate) AS Month,
    FishType,
    ROUND(AVG(PricePerKG), 2) AS AvgAuctionPrice
FROM AuctionPrices
GROUP BY Month, FishType
ORDER BY Month, FishType;

-- 3. Weekly vessel catch and average price
SELECT 
    WEEK(c.CatchDate) AS WeekNumber,
    c.VesselID,
    v.VesselName,
    ROUND(SUM(c.WeightKG), 2) AS WeeklyCatchKG,
    ROUND(AVG(a.PricePerKG), 2) AS AvgAuctionPrice
FROM CatchLogs c
JOIN Vessels v ON c.VesselID = v.VesselID
JOIN AuctionPrices a ON c.CatchDate = a.AuctionDate AND c.FishType = a.FishType
GROUP BY WeekNumber, c.VesselID, v.VesselName
ORDER BY WeekNumber;

-- 4. Catch & market price trend by month
SELECT 
    MONTH(c.CatchDate) AS Month,
    c.FishType,
    ROUND(SUM(c.WeightKG), 2) AS TotalCatchKG,
    ROUND(AVG(m.MarketPricePerKG), 2) AS AvgMarketPrice
FROM CatchLogs c
JOIN MarketPrices m ON c.CatchDate = m.MarketDate AND c.FishType = m.FishType
GROUP BY Month, c.FishType
ORDER BY Month;

-- 5. Catch-to-Price Ratio Insight
SELECT 
    c.FishType,
    ROUND(SUM(c.WeightKG), 2) AS TotalCatchKG,
    ROUND(AVG(a.PricePerKG), 2) AS AvgAuctionPrice,
    ROUND(SUM(c.WeightKG) * AVG(a.PricePerKG), 2) AS EstimatedRevenue
FROM CatchLogs c
JOIN AuctionPrices a ON c.CatchDate = a.AuctionDate AND c.FishType = a.FishType
GROUP BY c.FishType;

-- 6. Vessel-wise revenue estimation to support scheduling decisions
SELECT 
    c.VesselID,
    v.VesselName,
    ROUND(SUM(c.WeightKG), 2) AS TotalCatchKG,
    ROUND(AVG(a.PricePerKG), 2) AS AvgPrice,
    ROUND(SUM(c.WeightKG) * AVG(a.PricePerKG), 2) AS EstimatedRevenue
FROM CatchLogs c
JOIN Vessels v ON c.VesselID = v.VesselID
JOIN AuctionPrices a ON c.CatchDate = a.AuctionDate AND c.FishType = a.FishType
GROUP BY c.VesselID, v.VesselName
ORDER BY EstimatedRevenue DESC;
