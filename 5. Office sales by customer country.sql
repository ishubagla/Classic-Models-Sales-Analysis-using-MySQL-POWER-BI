with main_cte as
(
select t1.orderNumber,t2.productcode,t2.quantityOrdered,
t2.priceeach,quantityOrdered*priceEach as sales_value, 
t3.city as customer_city,t3.country as customer_country,t4.productline,
t6.city as office_city,t6.country as office_country
from orders t1
inner join orderdetails t2
on t1.orderNumber=t2.ordernumber
inner join customers t3
on t1.customerNumber=t3.customerNumber
inner join products t4
on t2.productCode=t4.productCode
inner join employees t5
on t3.salesRepEmployeeNumber=t5.employeeNumber
inner join offices t6
on t5.officeCode=t6.officeCode
)
select
ordernumber,customer_city,customer_country,productline,office_city,office_country,sum( sales_value) as sales_value
from main_cte
group by ordernumber,customer_city,customer_country,productline,office_city,office_country
