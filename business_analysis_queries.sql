select * from public.superstore limit 50;

--> Total_Sales & Total_Profit
SELECT 
    ROUND(SUM("Sales")::numeric, 2) AS total_sales,
    ROUND(SUM("Profit")::numeric, 2) AS total_profit
FROM public.superstore;


--> Total_Order
select count(distinct"Order ID") AS total_orders from public.superstore; 

--> Top 10 Customers by Sales
select "Customer Name",
round(sum("Sales")::numeric, 2) AS total_sales 
from public.superstore s 
group by "Customer Name" 
order by total_sales desc 
limit 10;

--> Region Wise Sales 
select "Region" ,
round(sum("Sales")::numeric, 2) as total_sales  
from public.superstore s 
group by "Region" 
order by total_sales desc ;

--> Region Wise Profit 
select "Region" ,
round(sum("Profit")::numeric, 2) as total_profit  
from public.superstore s 
group by "Region" 
order by total_profit desc ;

--> Top Selling Categories
select "Category" ,
round(sum("Sales")::numeric, 2) as total_sales  
from public.superstore s 
group by "Category" 
order by total_sales desc;

--> Subcategories Analysis
select "Sub-Category" ,
round(sum("Sales")::numeric, 2 ) as total_sales ,
round(sum("Profit")::numeric, 2 ) as total_profit  
from public.superstore s 
group by "Sub-Category" 
order by total_sales  desc ;

--> Loss Making Products
select "Product Name" ,
round(sum("Profit")::numeric, 2 ) as loss_making
from public.superstore s 
group by "Product Name" 
having sum("Profit")  < 0
order by loss_making ;

--> Discount Impact on Profit 
select "Discount" ,
round(avg("Profit")::numeric, 2) as avg_profit 
from public.superstore s 
group by "Discount" 
order by "Discount" ;

--> Most Profitable Product 
select "Product Name" ,
round(sum("Profit")::numeric, 2) as total_profit  
from public.superstore s 
group by "Product Name" 
order by total_profit desc 
limit 10;

--> Ship Mode Analysis 
select "Ship Mode" ,
round(sum("Sales")::numeric, 2 ) as total_sales ,
round(sum("Profit")::numeric, 2 ) as total_profit
from public.superstore s 
group by "Ship Mode" 
order by total_sales desc ;

--> Monthly Sales Trend
select extract (month from ("Order Date") :: date) as month ,
round(sum("Sales")::numeric , 2) as total_sales 
from public.superstore s 
group by month
order by month ;


