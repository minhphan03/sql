SELECT CONCAT(Name, '(',SUBSTR(Occupation, 1,1), ')')
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.') AS Total
FROM Occupations
Group by Occupation
Order by Total;
