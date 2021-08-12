# Write your MySQL query statement below
select p.email as Email from Person as P
group by p.email
having count(*) > 1
