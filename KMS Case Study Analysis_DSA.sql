create database KMS_db

-----Data cleaning Done ( duplicates removed, data type change effected)----

------Table created via flat file import-----

-------CASE SCENARIO 1---------------------

Select * from [KMS Sql Case Study]

------KMS Inventory Analysis Question------

--------1.  Product Category with The Highest Sales---------

select max (Product_Category) as [Product Category], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
group by Product_Category
order by [Total Sales] desc;
------% Technology Returned with the Highest Sales % -----------


--------2a.  Top 3 Regions in terms of sales?---------

select top 3 Region as [Top 3 Regions], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
group by Region
order by [Total Sales] desc
------% West, Ontario and Prarie returned with the Highest Sales per Region-------------

--------2b.  Bottom 3 Regions in terms of sales?---------

select Top 3 Region as [Bottom 3 Regions], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
group by Region
order by [Total Sales] asc
-------% Nunavut, Northwest Territories and Yukon returned with the lowest Sales per Region-----------

-------------3. Total sales of appliances in Ontario?-----------

select Province, count (Province) as [Total Count], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
where province = 'Ontario' and (Product_Sub_Category)= 'Appliances'
group by Province
------% Ontarion returned with 20,2346.839630127--------------

-------------4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers---------

-------Comparing Bottom 10 Customers with Lowest revenues with Top 10 with Highest Revenues to give insight accordingly---------

select top 10 Customer_Name, (Product_Category), sum (Sales) as [Total Revenue],count (Order_ID) as [Total Orders], AVG (Sales) as [Average Sales]
from [KMS Sql Case Study]
group by customer_name, Product_Category
order by [Total Revenue] asc

select top 10 Customer_Name, (Product_Category),sum (Sales) as [Total Revenue],count (Order_ID) as [Total Orders], AVG (Sales) as [Average Sales]
from [KMS Sql Case Study]
group by customer_name, Product_Category
order by [Total Revenue] desc

-------Findings-----------
------i. The Analysis uncovers the growing demand for technology which accounts for the highest Sales with comensurate profit margin
------ii. The Data reveals the decline in the demand for traditional equipment which in turn affects sales and overall revenue.
------iii. The Bottom 10 have Low Order Count resulting in Low sales and values compared to the Top 10 Customers. 

-------Recommendation----------
------i.Increase in frequency and Volume of purchase to increase Sales and consequent revenues
------ii. Focusing on excellent customer service through quick response times, personalized support and more convenient options for order and delivery ------
------iii. Utilizing technology to build online presence to attract newer customers to increase sales in the bottom Category.


--------5. KMS incurred the most shipping cost using which shipping method?-----------

select distinct Ship_Mode, sum(Shipping_Cost) as [Total Shipping Cost] from [KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost] desc
----% Using the Delivery Truck as a Ship Mode, KMS incured The Most Shipping Cost-----------

-------CASE SCENARIO 2----------------------------

----------6. The most valuable customers, and the products or services they typically purchase--------------

select top 3 Customer_Name as [Top 3 Valuable Customers], Product_Name, sum(Profit) as [Total Profit], 
sum(Sales) as [Total Sales] from [KMS Sql Case Study]
group by Customer_Name, product_Name
order by [Total Sales] desc
------------% Emily Phan is the most Valuable Customer with the highest sales of 89,061.046875------------

---------7. The small business customer with the highest sales?

select Top 3 Customer_Name, Customer_Segment, sum (Sales) as [Highest Sales] from [KMS Sql Case Study]
where customer_segment= 'Small Business'
group by Customer_Name, Customer_Segment
order by [Highest Sales] desc
--------% Dennis Kane returns as the Small Business Customer with The Highest Sales-------

---------8. The Corporate Customer that placed the most number of orders in 2009 – 2012?-----------

select top 3 Customer_Name, Customer_Segment, count (Order_Quantity) as [Total Order Quantity] from [KMS Sql Case Study]
where Customer_Segment= 'Corporate' and year(Order_Date) between '2009' and '2012'
group by Customer_Name, Customer_Segment
order by [Total Order Quantity] desc
---------% Adam Hart placed the most orders in the Corporate Customer Segment within the years 2008 - 2012


--------9. Which consumer customer was the most profitable one?----------------

select Top 3 Customer_Name, Customer_Segment,Profit as [Highest Profit] from [KMS Sql Case Study]
where Customer_Segment= 'Consumer'
order by [Highest Profit] desc
--------% Emily Phan returned with the Most Profitable Customer with profit of 27,220.69----

--------10. Which customer returned items, and what segment do they belong to?

--------Imported CSV file (Order Status)

Select * from Order_Status
Select * from [KMS Sql Case Study]

select distinct KMS.Customer_Name, KMS.Customer_Segment,OS.Status from [KMS Sql Case Study]
as KMS inner join Order_Status as OS 
on KMS.Order_ID=OS.Order_ID 

-----% A count of 419 Customers returned items across the various Customer Segment.

---------11.  If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, 
--------------do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer

select Order_Priority,Ship_Mode, count (Order_Quantity) as [Total Orders], 
AVG(Shipping_cost) as [Avg Shipping Cost] from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
Order by Order_Priority, [Avg Shipping Cost]

--------% Yes, the company considered the order of priority in meeting customers satisfaction.....................
--------% The Truck though undeniably cost effective for both the customers and company is tailored to service customers without any critical delivery timeline--
--------% The ton of patronage of this ship Mode with consequent sales values adds significantly to the overall sales revenue--------------
--------% Air was used for timely delivery of Critical orders to satisfy high-end valued customers--------
