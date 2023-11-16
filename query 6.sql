/*Shipping is delayed due to the weather, and its possible that 
it will take 3 ays to arrive. Get a list of affected countries*/
select*,
date_add(shippeddate, interval 3 day) as latest_arrival,
case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end as late_flag
from orders
where 
(case when date_add(shippeddate, interval 3 day) > requireddate then 1 else 0 end)=1