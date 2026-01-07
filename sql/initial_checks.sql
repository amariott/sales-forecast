select count(*) from sales_raw;

select min(date), max(date) from sales_raw;

select Store, sum(Weekly_Sales) as total_sales
from sales_raw
group by Store
order by total_sales desc
limit 10;

select sum(case when Weekly_Sales is null then 1 else 0 end) as miss_sales,
sum(case when Date is null then 1 else 0 end) as miss_date,
sum(case when Store is null then 1 else 0 end) as miss_store
from sales_raw;
