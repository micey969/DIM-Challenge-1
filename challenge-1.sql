-- question 1 & 2
select item_name, sum(quantity) as quan
from chipotle
group by item_name
order by quan desc
limit 1


-- question 3
select choice_description, count(choice_description) as quan
from chipotle
where choice_description != 'NULL'
group by choice_description
order by quan desc
limit 1


-- question 4
select sum(quantity) as titems
from chipotle


--question 5
alter table chipotle
alter column item_price float


-- question 6
select sum(item_price) as trevenue
from chipotle


-- question 7
select count(distinct order_id) as torders
from chipotle


-- question 8
select avg(item_price) as avgrevenue
from chipotle


-- question 9
select count(distinct item_name) as nitems
from chipotle
