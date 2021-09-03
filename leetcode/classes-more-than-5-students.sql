-- group by class, then use count to remove duplicated students in a class itself, and finally count

SELECT class
FROM 
(SELECT class, count(distinct student) AS NUM FROM courses group by class) as temp_table
WHERE num >=5
