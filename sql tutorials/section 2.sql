SELECT * 
FROM insurance.claimlog
order by PK;

SELECT Username, lastfirstname, title, paymentLImit
FROM Insurance.users
order by paymentLimit DESC
limit 4;

SELECT claimnumber, InjuryState, ExaminerCode
FROM insurance.claim
WHERE ExaminerCode= 'lnikki';

SELECT UserName, Title, ReserveLimit
FROM insurance.users
WHERE title like "%specialist";

SELECT *
FROM insurance.claimant
WHERE reopenedDate is null;

select *
FROM insurance.claimant
where YEAR(closedDate) = 2018 AND ReopenedDate is null;

-- aggregate functions

select max(paymentlimit) as MaxPaymentLimit
from insurance.users;

select avg(ReserveAmount) as AverageReserveAmount
from insurance.reserve;

-- distinct and group by

select distinct examinercode
from insurance.claim;

select distinct JurisdictionID,ExaminerCode, InjuryState, year(EntryDate)
from insurance.claim;

-- distinct cannot be used with aggregate functions, so we have to use group by
select examinercode, count(ExaminerCode) as sum
from insurance.claim
group by ExaminerCode;

select examinercode, count(*) as sum
from insurance.claim
group by ExaminerCode;

select examinercode, InjuryState, count(*) as sum
from insurance.claim
group by ExaminerCode, InjuryState;

select enteredby, count(*) as publishes
from insurance.reservingtool
where IsPublished = 1
group by enteredby;

select * from insurance.patient order by businessname;

select businessname, count(BusinessName) as c
from insurance.patient
where businessname like '%inc%'
group by BusinessName
order by c desc
limit 10;

select businessname, count(BusinessName) as c
from insurance.patient
group by BusinessName
order by c desc
limit 10;

select * from insurance.attachment
where enteredby in ('qkemp','unassigned','kgus');

-- having is the where syntax for aggregate functions
-- put where at the end will give a syntax error so use having

select enteredby, count(*) as publishes
from insurance.reservingtool
where IsPublished = 1
group by enteredby
having publishes > 50
order by publishes desc;

