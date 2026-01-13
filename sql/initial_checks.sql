select count(*) from sales_raw;
'датасет содержит 6435 строк'

select min(date), max(date) from sales_raw;
'диапазон рассматриваемых дат 31-12-2010 - 01-04-2011'

select Store, sum(Weekly_Sales) as total_sales
from sales_raw
group by Store
order by total_sales desc
limit 10;
'магазины с наибльшими продажами: номер магазина|сумма всех продаж
20|301397792.46
4|299543953.38
14|288999911.34
13|286517703.8
2|275382440.98
10|271617713.89
27|253855916.88
6|223756130.64
1|222402808.85
39|207445542.47
продажи распределены неравномерно между магазинами'

select sum(case when Weekly_Sales is null then 1 else 0 end) as miss_sales,
sum(case when Date is null then 1 else 0 end) as miss_date,
sum(case when Store is null then 1 else 0 end) as miss_store
from sales_raw;
'пропуски в ключевых полях (дата, идентификатор магазина, целевая переменная) отсутствуют,
что позволяет перейти к этапу моделирования без дополнительной обработки missing values'