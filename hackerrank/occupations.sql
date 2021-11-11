-- create a virtual table with columns as occupations and values as name

-- set count variables
SET @c1=0, @c2=0, @c3=0, @c4=0;

-- use min function to eliminate null values 
SELECT min(Doctor), min(Professor), min(Singer), min(Actor)
FROM 
(SELECT case
-- count and put each count track into a new column
    when Occupation='Doctor' then (@c1=@c1+1)
    when Occupation='Professor' then (@c4=@c4+1)
    when Occupation='Actor' then (@c2=@c2+1)
    when Occupation='Singer' then (@c3=@c3+1) end as RowNumber,

-- variable + end as + column name to put the value of the variable into a column
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Actor' then Name end as Actor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Professor' then Name end as Professor
FROM OCCUPATIONS ORDER BY Name) temp
GROUP BY RowNumber;



