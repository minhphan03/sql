# Write your MySQL query statement below
select c.name as Customers from Customers as c
left join orders as o on o.customerId=c.id
where o.id is null
