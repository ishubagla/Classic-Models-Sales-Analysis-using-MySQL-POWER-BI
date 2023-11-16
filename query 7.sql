/*Breakdowncof each customer and their sales, 
but include a money owed column to see if any customers have gone over credit limit.*/

with cte_sales as
(
select
orderdate,t1.ordernumber,customerName,t3.customernumber,productcode,creditlimit,
quantityOrdered*priceEach as sales_value
from orders t1
inner join orderdetails t2
on t1.orderNumber=t2.orderNumber
inner join customers t3
on t1.customerNumber=t3.customerNumber),

running_total_sales_cte as
(
select*, lead(orderdate)over(partition by customernumber order by orderdate) as next_order_Date
from
(
select orderdate,ordernumber,customername,customernumber,creditlimit,sum(sales_value) as salesvalue
from cte_sales
group by orderdate,ordernumber,customername,customernumber,creditlimit
)subquery
),
payment_cte as
(select*
from payments),

main_cte as
(
select t1.*,sum(salesvalue) over(partition by t1.customernumber order by orderdate) as running_total_sales,
sum(amount) over(partition by t1.customernumber order by orderDate) as running_total_payments
from running_total_sales_cte t1
left join payment_cte t2
on t1.customernumber=t2.customernumber and t2.paymentdate between t1.orderdate and  
case when t1.next_order_Date is null then current_date else next_order_Date end
)
select*, running_total_sales-running_total_payments as money_owed,
creditlimit-(running_total_sales-running_total_payments) as difference
from main_cte
