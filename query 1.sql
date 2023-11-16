/*overview of sales for 2004*/
/*breakdown by product country and city */
/*include sales value,cost of sales and net profit*/
select orderdate,t1.ordernumber,quantityOrdered,priceeach,productName,productLine,buyPrice,country,city
from orders t1
inner join orderdetails t2
on t1.orderNumber=t2.orderNumber
inner join products t3
on t2.productCode=t3.productCode
inner join customers t4
on t1.customerNumber=t4.customerNumber
where year(orderdate)=2004;

