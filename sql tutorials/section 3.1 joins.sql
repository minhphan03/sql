-- INNER JOIN

SELECT R.ClaimantID, RT.ReserveTypeDesc as Descript, R.ReserveAmount
FROM Reserve R
INNER JOIN ReserveType RT ON R.ReserveTypeID = RT.ReserveTypeID;

SELECT Reserve.ClaimantID, ReserveType.ReserveTypeDesc, Reserve.ReserveAmount
FROM Reserve
INNER JOIN ReserveType on Reserve.ReserveTypeID = ReserveType.ReservetypeID;

-- inner join 3+ different tables together
-- find the connection that build a complete profile from claimant and claim, then use it to continue building it with claimanttype
SELECT C.ClaimNumber, CT.ClaimantTypeDesc as ClaimantType
FROM claim C
INNER JOIN claimant CLM ON CLM.ClaimID = C.ClaimID
INNER JOIN claimanttype CT ON CLM.ClaimantTypeID = CT.ClaimantTypeID;

-- claimnumber is a unique field, you don't have to put C. in front of it
SELECT ClaimNumber, CL.*
FROM Claim C
INNER JOIN Claimlog CL ON C.ClaimID = CL.PK 
ORDER BY PK
LIMIT 100;

-- LEFT JOIN

SELECT ClaimNumber
FROM Claim C
LEFT JOIN claimlog CL on C.ClaimID = CL.PK
ORDER BY ClaimNumber
LIMIT 100;

-- do the calculate first, then the join later (?) on the ExpenseReservingAmount
SELECT C.ClaimNumber, sum(RT.ExpenseReservingAmount) as ExpensesSum
FROM Claim C
LEFT JOIN ReservingTool RT on C.ClaimNumber = RT.ClaimNumber ;

-- have to use group by because of the sum at first, so it return all claim numbers
SELECT C.ClaimNumber, sum(RT.ExpenseReservingAmount) as ExpensesSum
FROM Claim C
LEFT JOIN ReservingTool RT on C.ClaimNumber = RT.ClaimNumber
GROUP BY C.ClaimNumber 
ORDER BY C.ClaimNumber asc;

-- there is one null expensesSum value in the query if use left join, so use inner join (return 99)
SELECT C.ClaimNumber, sum(RT.ExpenseReservingAmount) as ExpensesSum
FROM Claim C
INNER JOIN ReservingTool RT on C.ClaimNumber = RT.ClaimNumber
GROUP BY C.ClaimNumber
ORDER BY ExpensesSum;

-- check with just using inner join (return 100)
SELECT C.ClaimNumber, sum(RT.ExpenseReservingAmount) as ExpensesSum
FROM Claim C
LEFT JOIN ReservingTool RT on C.ClaimNumber = RT.ClaimNumber
GROUP BY C.ClaimNumber
ORDER BY ExpensesSum;