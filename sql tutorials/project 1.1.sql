-- the last date a claimant reopen claim (hint: claimant table)
select claimantId, reopeneddate 
from insurance.claimant
where ReopenedDate is not null;

-- the date an examiner was assigned a claim (claimlog table)
select PK, max(EntryDate) as RecentDate
from insurance.claimlog
where FieldName = 'ExaminerCode'
group by PK;

-- the last date an examiner published on the reservingtool table for each claim
select ClaimNumber,max(EnteredOn)
from insurance.reservingtool 
where IsPublished = 1
group by ClaimNumber
order by ClaimNumber;

select ClaimNumber, EnteredOn
from  insurance.reservingtool
where IsPublished = 1;