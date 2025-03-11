/*

Price Analysis regarding retail price of fruit for the year 2022


*/

-- Data Quality Check--
Select * From Fruit_Veggie.fruit_prices		-- Missing Values
Where RetailPrice='Null' or Yield='Null';

Select Fruit, Form, Count(*) From Fruit_Veggie.fruit_prices		-- Duplicates check
Group By Fruit, Form
Having Count(*)>1;

-- Table that demonstrates Price Range for each Form of Fruit
Select Form, Min(RetailPrice) AS min_price,
			Max(RetailPrice) AS max_price,
			AVG(RetailPrice) AS avg_price
From Fruit_Veggie.fruit_prices
Group By Form;

-- Fruit Selection
Select * from Fruit_Veggie.fruit_prices;

-- Table that demonstrates the 3 most expensive Fruits
Select Fruit, RetailPrice, RetailPriceUnit
From Fruit_Veggie.fruit_prices
Order By RetailPrice Desc
Limit 5;

-- Table demonstrating Most Expensive Form of Fruit on Average
Select Form, Avg(RetailPrice), RetailPriceUnit
From Fruit_Veggie.fruit_prices
Group By Form
Order By Avg(RetailPrice) Desc;

-- Price variation of fruit according to Form
Select Fruit,Form, Avg(RetailPrice), RetailPriceUnit
From Fruit_Veggie.fruit_prices
Group By Fruit, Form
Order By Fruit;

-- Affordability
-- Table demonstrates fruit that provides the best value for the usable produce
Select Fruit, Form, Avg(CupEquivalentPrice) AS Avg_Cup_Price
From Fruit_Veggie.fruit_prices
Group By Form, Fruit
Order By Avg_Cup_Price ASC
Limit 5; -- (As expected, juice provides the most value because it is all consumed)

-- Fresh vs Canned: Which is more affordable?
Select Fruit, Form, Avg(CupEquivalentPrice) AS Avg_Cup_Price
From Fruit_Veggie.fruit_prices
Where Form='Canned' OR Form='Fresh'
Group By Form, Fruit
Order By Avg_cup_Price; -- Fresh fruit is predomantly more affordable than canned

-- Higher Yield correlated to Lower Price?
Select Fruit, Form, Avg(Yield) AS Avg_Yield, Avg(RetailPrice) AS Avg_Retail_Price
From Fruit_Veggie.fruit_prices
Group By Form, Fruit
Order By Avg_Yield DESC; -- By Graphics an answer might be obtained

-- Ranking of each Price per cup for each Form
Select *
From(
Select Fruit, Form,
	Rank() OVER (Partition By Form Order By CupEquivalentPrice DESC) AS Fruit_Ranking
From Fruit_Veggie.fruit_prices)
As X
Where Fruit_Ranking<=3; -- Final table will provide the 3 most affordable fruits according to price per cup

-- Price Outliers (Application of CTEs)
With O AS
(Select Form, Avg(RetailPrice) AS Outlier_Avg_Price -- CTE will group the average retail price by form
From Fruit_Veggie.fruit_prices
Group By Form
)
Select F.Fruit, F.Form, F.RetailPrice, O.Outlier_Avg_Price
From Fruit_Veggie.fruit_prices AS F		-- Fruit table renamed to F
Join O ON F.Form=O.Form					-- Both tables are joined by the common Form column
Where F.RetailPrice>1.5*O.Outlier_Avg_Price;	-- Calculation of the Outlier
