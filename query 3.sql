/*customers' sales value by credit limit*/
/*group the credit limits as high level view to see
 if we get higher sales for customers who have a higher credit limit which we would expect*/
with cte_main as
(
select t1.orderNumber,t3.customerNumber,productCode,quantityOrdered,priceEach,priceeach*quantityOrdered as sales_value, creditLimit
from orders t1
inner join orderdetails t2
on t1.orderNumber=t2.orderNumber
inner join customers t3
on t1.customerNumber=t3.customerNumber
)
select orderNumber,customerNumber, 
case when creditLimit<75000 then 'a:less than $75k'
when creditlimit between 75000 and 100000 then 'b:$75k-$100k'
when creditlimit between 100000 and 150000 then 'c:$100k-$150k'
when creditlimit>150000 then 'd:over$150k'
else 'other'
end as creditlimit_group,
sum(sales_value) as sales_value
from cte_main
group by ordernumber,customernumber,creditlimit_group