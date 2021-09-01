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