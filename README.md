# KMS-Analysis-Using-SSMS
This SQL project was undertaken to explore and analyze the KMS dataset to uncover negative trends which resulted in negative sales and boost profit opportunities.

# Project Overview
- This project is targetted at answering key business related questions as regards the dataset in other to increase customer and sales prfitability.
- The Project uncovers just how much is needed to meet customers satisfaction across various Customer Segment and Product need while in business with the findings.The Datasets used included records such as; Order ID, Customer Name, Shipping Cost, Order Date, Province, Product Category, Product Name, Order Quantity, sales, profit, and Order Status.

# Main Highlights Explored
    1. Analyzing Top customers by their Order frequency
    2. Product Profitability: Checking which product categories drive the highest sales or revenue 
    3. Examing the low and high performning provinces and regions in terms of sales and purchase.
    4. Analysing various shipping cost with respect to order of priority.
    5. measuring customer satisfaction with profitability.

# Tools Used
- SQL: For cleaning Dataset, Annalysis

# Key Insights
    1. Analyzing Top customers by their Order frequency
      - Top Customers ordered the most items with consequent increase in profit and sales

    2. The Techology product category returned the highest due to increase in demand in Tecnologyy.
      - Product Profitability: Checking which product categories drive the highest sales or revenue 
      
    4 Examing the low and high performning provinces and regions in terms of sales and purchase.
    
    5. Analysing various shipping cost with respect to order of priority.
    
    6. measuring customer satisfaction with profitability.

# Data Processing
The Workflow included:
  1. Data Importation/ Data cleaning and formatting
    - Duplicates were removed and data was formatted converted text to column, and missing values handled where applicable. This was done to ensure records          contained, maintained data integrity and prevent errors during analysis.
    - Field formats were Standardized to apropriate data types to avoid errors during analysis.

# Data Analysis Questions with codes

create database KMS_db

-----Data cleaning Done ( duplicates removed, data type change effected)----

------Table created via flat file import-----

-------CASE SCENARIO 1---------------------

Select * from [KMS Sql Case Study]

------KMS Inventory Analysis Question------

--------1.  Product Category with The Highest Sales---------
![KMS Analysis 1_DSA](https://github.com/user-attachments/assets/9a2f749d-6d41-4726-abda-f937da520189)

select max (Product_Category) as [Product Category], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
group by Product_Category
order by [Total Sales] desc;
------% Technology Returned with the Highest Sales % -----------


--------2a.  Top 3 Regions in terms of sales?---------
![KMS Analysis 2_DSA](https://github.com/user-attachments/assets/30f06a8f-8c71-4cee-9140-bcc0c2010a7e)

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
![KMS Analysis 3_DSA](https://github.com/user-attachments/assets/bf1c28c3-a470-47e3-8d00-2a85f5735577)

select Province, count (Province) as [Total Count], sum (Sales) as [Total Sales] from [KMS Sql Case Study]
where province = 'Ontario' and (Product_Sub_Category)= 'Appliances'
group by Province
------% Ontarion returned with 20,2346.839630127--------------

-------------4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers---------
![KMS Analysis 4_DSA](https://github.com/user-attachments/assets/4d0b5a8e-4e0f-4633-a503-038a1e3d0943)


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
![KMS Analysis 5_DSA](https://github.com/user-attachments/assets/ebafd939-79bb-434e-9cf2-5bfa757ef5b5)


select distinct Ship_Mode, sum(Shipping_Cost) as [Total Shipping Cost] from [KMS Sql Case Study]
group by Ship_Mode
order by [Total Shipping Cost] desc
----% Using the Delivery Truck as a Ship Mode, KMS incured The Most Shipping Cost-----------

-------CASE SCENARIO 2----------------------------

----------6. The most valuable customers, and the products or services they typically purchase--------------
![KMS Analysis 6_DSA](https://github.com/user-attachments/assets/7069eccf-d744-4502-ab70-6eff2d123f9e)


select top 3 Customer_Name as [Top 3 Valuable Customers], Product_Name, sum(Profit) as [Total Profit], 
sum(Sales) as [Total Sales] from [KMS Sql Case Study]
group by Customer_Name, product_Name
order by [Total Sales] desc
------------% Emily Phan is the most Valuable Customer with the highest sales of 89,061.046875------------

---------7. The small business customer with the highest sales?
![KMS Analysis 7_DSA](https://github.com/user-attachments/assets/70b42ec4-93a9-4ff2-8bdf-74d4f722c272)

select Top 3 Customer_Name, Customer_Segment, sum (Sales) as [Highest Sales] from [KMS Sql Case Study]
where customer_segment= 'Small Business'
group by Customer_Name, Customer_Segment
order by [Highest Sales] desc
--------% Dennis Kane returns as the Small Business Customer with The Highest Sales-------

---------8. The Corporate Customer that placed the most number of orders in 2009 – 2012?-----------
![KMS Analysis 8_DSA](https://github.com/user-attachments/assets/34e28d65-9f3d-456d-9506-67f19d9f1fcf)

select top 3 Customer_Name, Customer_Segment, count (Order_Quantity) as [Total Order Quantity] from [KMS Sql Case Study]
where Customer_Segment= 'Corporate' and year(Order_Date) between '2009' and '2012'
group by Customer_Name, Customer_Segment
order by [Total Order Quantity] desc
---------% Adam Hart placed the most orders in the Corporate Customer Segment within the years 2008 - 2012

--------9. Which consumer customer was the most profitable one?----------------
![KMS Analysis 9_DSA](https://github.com/user-attachments/assets/7dea1b71-e995-48c5-a50a-df5cb5bc1ca7)

select Top 3 Customer_Name, Customer_Segment,Profit as [Highest Profit] from [KMS Sql Case Study]
where Customer_Segment= 'Consumer'
order by [Highest Profit] desc
--------% Emily Phan returned with the Most Profitable Customer with profit of 27,220.69----

--------10. Which customer returned items, and what segment do they belong to?
![KMS Analysis 10_DSA](https://github.com/user-attachments/assets/522f27b2-9424-4c67-9955-f62af9450b87)

--------Imported CSV file (Order Status)

Select * from Order_Status
Select * from [KMS Sql Case Study]

select distinct KMS.Customer_Name, KMS.Customer_Segment,OS.Status from [KMS Sql Case Study]
as KMS inner join Order_Status as OS 
on KMS.Order_ID=OS.Order_ID 
-----% A count of 419 Customers returned items across the various Customer Segment.


---------11.  If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, 
--------------do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer
![KMS Analysis 11_DSA](https://github.com/user-attachments/assets/befd7c69-e485-4e43-8a28-a7607ce9c76c)

select Order_Priority,Ship_Mode, count (Order_Quantity) as [Total Orders], 
AVG(Shipping_cost) as [Avg Shipping Cost] from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
Order by Order_Priority, [Avg Shipping Cost]

--------% Yes, the company considered the order of priority in meeting customers satisfaction.....................
--------% The Truck though undeniably cost effective for both the customers and company is tailored to service customers without any critical delivery timeline--
--------% The ton of patronage of this ship Mode with consequent sales values adds significantly to the overall sales revenue--------------
--------% Air was used for timely delivery of Critical orders to satisfy high-end valued customers--------

# Improvements
  - Availability of products in the right quantity to encourage more patronage and increase sales
  - Customer feedback should be encouraged


# Skills Included
  - Data Cleaning, Data Analysis, Data Manipulation Language, Data Definition Language

# Results:
  - This Result shows that Technology is in high demand as the highest sales and most profitable customer is from the Tecnology Product Category contributing to large sales.
  - The increase sales in the use of delivery Truck also shows that people want to have a good reason to more for certain services and if their product is not critical they'd rather wait for the normal time to receive truck delivery of their item.
  - More people will naturally fall into this category thereby increasing the Sales value and revenue.
  - More allocation should be given to the truck delivery for maintenance to enhance more sales



