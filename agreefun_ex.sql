show databases;
use agregate_fun;
CREATE TABLE SalesData (
    SaleID INT,
    ProductID INT,
    Region VARCHAR(255),
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE);
INSERT INTO SalesData (SaleID, ProductID, Region, SalesAmount, SaleDate) VALUES
(1, 101, 'North', 500.00, '2023-01-15'),
(2, 102, 'South', 300.00, '2023-01-16'),
(3, 101, 'East', 450.00, '2023-01-17'),
(4, 103, 'West', 600.00, '2023-01-18'),
(5, 102, 'North', 700.00, '2023-02-15'),
(6, 104, 'South', 200.00, '2023-02-16'),
(7, 105, 'East', 900.00, '2023-02-17'),
(8, 101, 'West', 400.00, '2023-02-18'),
(9, 103, 'North', 800.00, '2023-03-15'),
(10, 104, 'South', 100.00, '2023-03-16'),
(11, 101, 'East', 300.00, '2023-03-17'),
(12, 102, 'West', 500.00, '2023-03-18'),
(13, 105, 'North', 600.00, '2023-04-15'),
(14, 101, 'South', 400.00, '2023-04-16'),
(15, 102, 'East', 700.00, '2023-04-17'),
(16, 103, 'West', 500.00, '2023-04-18'),
(17, 104, 'North', 200.00, '2023-05-15'),
(18, 105, 'South', 300.00, '2023-05-16'),
(19, 101, 'East', 400.00, '2023-05-17'),
(20, 102, 'West', 600.00, '2023-05-18');
select * from SalesData;
show tables ;
describe SalesData;

-- 1 Calculate the total sales amount for each region.
select region , sum( SalesAmount) as total_sales
from SalesData group by region;

-- Q.2 Write a query to count the number of sales transactions for each product.
 select * from salesdata;
 select productid , count(*) as transactions_count
 from SalesData group by productid;

-- Q.3 Write a query to find the average sales amount for each region.
select region, avg(salesAmount) as averagesales 
from salesdata group by region;

-- Q.4 Write a query to find the highest sales amount for each product.
select productid, max(salesamount) as highestsale
from salesdata group by productid;

-- Q.5 Write a query to find the total sales amount for each month.
select date_format(saledate,'%y-%m' ) as month, sum(salesamount) as totalsale
from salesdata group by date_format(saledate,'%y-%m' );


-- Q.6 Write a query to find the total sales amount for each product in each region.
select region , productid,sum(salesamount) as totalsales
from salesdata
group by  region , productid;

-- Q.7 Write a query to find the number of sales transactions for each product and each region.
select region , productid, count(*) as  transaction_count
from salesdata
group by  region , productid;
select*from salesdata;

-- Q.8 Write a query to find each product's average sales amount per region.
select productid,region, avg(salesamount) as amount_per_region
from salesdata
group by region,productid;

-- Q.9 Write a query to find the total sales amount for each product for each quarter (using the QUARTER function).
select quarter(saledate) as quarter , sum(salesamount) as product_sale
from salesdata
group by  quarter(saledate);

-- Q.10 Write a query to find the total sales amount for each product sold in the first quarter (January, February, and March).
select quarter(saledate) as quarter , sum(salesamount) as product_sale
from salesdata
group by  quarter(saledate) limit 1;

-- Q.11 Write a query to find the total sales amount for each region and each year.
select region, date_format(saledate,'20%y') as year, sum(salesamount) as total_sale
from salesdata group by region , year;

-- Q.12 Write a query to find the product with the highest sales in each region.
select region , max(salesamount) as highest_sale
from salesdata group by region;

-- Q.13 Write a query to find the average sales amount per product for each region.
select region,productid, avg(salesamount) as avgsales 
from salesdata group by region,productid;

-- Q.14 Write a query to find the sales count for each region, for the last 2 months (based on SaleDate)
select region , month(saledate) as month ,count(salesamount) as salecount
from salesdata 
where month(saledate) = 2
group by region,month  ;

-- Q. 15 Write a query to find the total sales amount for each product and each quarter of the year
select   productid,quarter(saledate) as quarter ,date_format(saledate,'20%y') as year ,sum(salesamount) as totalsale
from salesdata group by  productid, quarter,year ; 

-- Q.16 Identify the maximum sales amount recorded in each year.
select date_format(saledate,'20%y') as year, max(salesamount) as maxsales
from salesdata group by year;

-- Q.17 Count the total number of sales transactions for each day of the week.
select date_format(saledate,'%d') as day ,count(*) as transaction_count
from salesdata group by day;

-- Q.18 Identify all sales transactions where the sales amount was over $500.
select salesamount, sum(salesamount)  as transaction_count
from salesdata group by salesamount
having sum(salesamount) >500 ;

-- Q.19 Determine which region had the least number of sales transactions.
select region ,count(*) as transaction_count
from salesdata group by region limit 1;

-- Q.20 Identify which year had the highest average sales amount.
select date_format(saledate,'20%y') as year, avg(salesamount) as highestsale
from salesdata group by  year order by highestsale desc;