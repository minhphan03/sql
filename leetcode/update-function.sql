-- swap male to female and vice versa
UPDATE Salary
SET sex = if(sex = 'm','f','m')
