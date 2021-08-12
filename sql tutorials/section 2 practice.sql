select * 
from insurance.attachment
where enteredby = 'lnikki' and filename like '%pdf';

-- find all the medical reserve type records in the reserve type table
select *
from insurance.reservetype
where ReserveTypeCode = 'Medical' or reserveTypeID = 1 or ParentID = 1;

-- which claimants (claimantID) have at least 15 reserve changes using reserve table
select claimantID, count(*)
from insurance.reserve
group by claimantID
having count(*) >= 15;

-- copy the claim table schema into a table called claim2 (without any data)
create table insurance.claim2 as
select * from insurance.claim
limit 0;

-- how many of each document type are in the attachment table
select right(filename,4) as filetype, count(*) as count 
from insurance.attachment
group by filetype;