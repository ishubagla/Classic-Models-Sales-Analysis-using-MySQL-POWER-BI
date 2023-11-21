/*show cusomers sales value change and include a column which shows the difference in value from their previous sale.
To see if new customers who make their first purchase are likely to spend more.*/
with main_cte as
(
select ordernumber,orderdate,customernumber ,sum(sales_value) as salesvalue
from
(select t1.ordernumber,orderdate,customerNumber,productcode, quantityOrdered*priceEach as sales_value
from orders t1
inner join orderdetails t2
on t1.orderNumber=t2.orderNumber)main
group by ordernumber,orderdate,customernumber
),
/*no need to add with when second sub query*/
sales_query as
(
select t1.*,customerName, row_number() over(partition by customerName order by orderdate) as purchase_number,
lag(salesvalue) over (partition by customerName order by orderdate)as previous_sales_value
from main_cte t1
inner join customers t2
on t1.customernumber=t2.customernumber)

select*, salesvalue-previous_sales_value as purchase_sales_value
from sales_query
where previous_sales_value is not null

