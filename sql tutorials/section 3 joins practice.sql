-- find the name of the patient with claim number x
SELECT concat(P.FirstName, " ",if(P.MiddleName,concat(P.MiddleName," "),""), P.LastName) as Name
FROM Patient P 
JOIN Claimant CLM on P.PatientID = CLM.PatientID
JOIN Claim C on C.ClaimID = CLM.ClaimID
WHERE ClaimNumber = '752663830-X';

-- which office has the most user
SELECT O.OfficeDesc FROM
(SELECT officeID, max(mycount) FROM
(SELECT officeID, count(OfficeID) mycount
FROM Users
GROUP BY OfficeID) temp) temp2
JOIN Office O ON temp2.officeID = O.officeID;

-- select all of the reserve changes a user made in san francisco
SELECT office.OfficeDesc, reserve.*
FROM reserve
LEFT JOIN users on reserve.enteredBy = users.UserName
JOIN office on users.OfficeID= office.OfficeID
WHERE office.OfficeDesc = 'San Francisco';

-- find the reserve type bucket of each reserve change
-- have to join the RT table with itself because the secondary buckets (parentID) is associated with the reserveTypeID itself in the table
-- use ifnull to choose between the two
SELECT ifnull(RT2.reserveTypeDesc,RT.reserveTypeDesc) as ReserveTypeDesc, R.*
FROM Reserve R
INNER JOIN reservetype RT ON R.reserveTypeID = RT.reserveTypeID
LEFT JOIN reservetype RT2 on RT.ParentID = RT2.reserveTypeID