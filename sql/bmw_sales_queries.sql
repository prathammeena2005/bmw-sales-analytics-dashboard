CREATE TABLE bmw_sales (
    Model VARCHAR(50),
    Year INTEGER,
    Region VARCHAR(50),
    Color VARCHAR(30),
    Fuel_Type VARCHAR(20),
    Transmission VARCHAR(20),
    Engine_Size_L DECIMAL(3,1),
    Mileage_KM INTEGER,
    Price_USD INTEGER,
    Sales_Volume INTEGER,
    Sales_Classification VARCHAR(20)
);

--Q1. Count the total number of sales records in the dataset
SELECT COUNT(*) AS Total_Records FROM bmw_sales;

--Q2. Count the total number of unique BMW models available
SELECT COUNT(DISTINCT Model) AS Total_Models FROM bmw_sales;

--Q3. Find the number of sales records for each BMW model
SELECT Model, COUNT(*) AS Total_Sales FROM bmw_sales
GROUP BY Model ORDER BY Total_Sales DESC;

--Q4. Calculate the average selling price of each BMW model
SELECT Model, ROUND(AVG(Price_USD), 2) AS Average_Price FROM bmw_sales
GROUP BY Model ORDER BY Average_Price DESC;

--Q5. Find the number of sales records in each region
SELECT Region, COUNT(*) AS Total_Sales FROM bmw_sales
GROUP BY Region ORDER BY Total_Sales DESC;

--Q6. Count the number of sales records for each fuel type
SELECT Fuel_Type, COUNT(*) AS Total_Sales FROM bmw_sales
GROUP BY Fuel_Type ORDER BY Total_Sales DESC;

--Q7. Count the number of sales records for each transmission type 
SELECT Transmission, COUNT(*) AS Total_Sales FROM bmw_sales
GROUP BY Transmission ORDER BY Total_Sales DESC;

--Q8. Calculate the average selling price in each region
SELECT Region, ROUND(AVG(Price_USD), 2) AS Average_Price FROM bmw_sales
GROUP BY Region ORDER BY Average_Price DESC;

--Q9. Calculate the total sales volume for each BMW model
SELECT Model, SUM(Sales_Volume) AS Total_Sales_Volume FROM bmw_sales
GROUP BY Model ORDER BY Total_Sales_Volume DESC;

--Q10. Count the number of sales records for each year
SELECT Year, COUNT(*) AS Total_Sales FROM bmw_sales
GROUP BY Year ORDER BY Year;

--Q11. Calculate the total revenue generated in each region
SELECT Region, SUM(Price_USD) AS Total_Revenue FROM bmw_sales
GROUP BY Region ORDER BY Total_Revenue DESC;

--Q12. Find the top 5 BMW models with the highest average selling price
SELECT Model, ROUND(AVG(Price_USD), 2) AS Average_Price FROM bmw_sales
GROUP BY Model ORDER BY Average_Price DESC LIMIT 5;

--Q13. Calculate the average engine size for each BMW model
SELECT Model, ROUND(AVG(Engine_Size_L), 2) AS Avg_Engine_Size FROM bmw_sales
GROUP BY Model ORDER BY Avg_Engine_Size DESC;

--Q14. Calculate the average mileage for each fuel type
SELECT Fuel_Type, ROUND(AVG(Mileage_KM), 2) AS Avg_Mileage FROM bmw_sales
GROUP BY Fuel_Type ORDER BY Avg_Mileage DESC;

--Q15. Calculate the total sales volume for each region
SELECT Region, SUM(Sales_Volume) AS Total_Sales_Volume FROM bmw_sales
GROUP BY Region ORDER BY Total_Sales_Volume DESC;

--Q16. Calculate the average sales volume recorded each year
SELECT Year, ROUND(AVG(Sales_Volume), 2) AS Avg_Sales_Volume FROM bmw_sales
GROUP BY Year ORDER BY Year;

--Q17. Calculate the average selling price for each fuel type
SELECT Fuel_Type, ROUND(AVG(Price_USD), 2) AS Average_Price FROM bmw_sales
GROUP BY Fuel_Type ORDER BY Average_Price DESC;

--Q18. Count the number of unique BMW models sold in each region
SELECT Region, COUNT(DISTINCT Model) AS Total_Models FROM bmw_sales
GROUP BY Region ORDER BY Total_Models DESC;

--Q19. Rank BMW models based on total revenue generated
SELECT Model, SUM(Price_USD * Sales_Volume) AS total_revenue, 
	RANK() OVER (ORDER BY SUM(Price_USD * Sales_Volume) DESC) AS revenue_rank
FROM bmw_sales GROUP BY Model;

--Q20. Compare each BMW model's average selling price with the overall average selling price
SELECT
    Model,
    ROUND(AVG(Price_USD), 2) AS model_avg_price,
    ROUND((SELECT AVG(Price_USD) FROM bmw_sales), 2) AS overall_avg_price,
    ROUND(AVG(Price_USD) - (SELECT AVG(Price_USD) FROM bmw_sales),2) AS price_difference
FROM bmw_sales
GROUP BY Model
ORDER BY model_avg_price DESC;