-- Get the claim statuses for every patient that has a middle name

-- fail: still have null middle names
SELECT CS.claimstatusdesc, P.patientID, P.MiddleName
FROM Patient P 
INNER JOIN Claimant CL ON cl.patientID = P.patientID
INNER JOIN ClaimStatus CS ON CS.claimstatusID = CL.claimstatusID
WHERE P.MiddleName  <> '';

-- solution : middle name is not a null-able field. it is just full of blank spaces.
SELECT CS.ClaimStatusDesc, P.*
FROM claimant CL
INNER JOIN claimstatus CS on CL.claimStatusID = CS.ClaimStatusID
INNER JOIN patient P on P.PatientID = CL.PatientID
WHERE P.MiddleName <> '';

-- Display the claim no and how many times each claim was locked or unlocked
-- Include claim numbers that were never locked or unlocked (null values)

-- first attempt failed because count is not correct (count adds 1 to null, while sum does not)

-- second attempt using sum
select 
c.ClaimNumber , 
sum(CL.FieldName = "LockedBy") as CountLock 
from claim C
left join claimlog CL on c.ClaimID = CL.PK
group by c.ClaimNumber
order by CountLock;

-- correct attempt 1 (does not show 0 countlock) because the where has deleted the nulls
select 
c.ClaimNumber , 
count(CL.FieldName) as CountLock
from claim C
left join claimlog CL on c.ClaimID = CL.PK
where CL.FieldName = 'LockedBy' 
group by c.ClaimNumber
order by CountLock;

-- instructor solution
-- if use fieldname in left join, null are counted as 0 not removed
select 
c.ClaimNumber , 
count(CL.PK) as CountLock
from claim C
left join claimlog CL on c.ClaimID = CL.PK and CL.FieldName = 'LockedBy'
group by c.ClaimNumber
order by CountLock;

-- raw query
select C.ClaimNumber , CL.PK, CL.FieldName
from claim C
left join claimlog CL on c.ClaimID = CL.PK and CL.FieldName = 'LockedBy'
order by C.ClaimNumber;