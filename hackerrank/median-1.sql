-- the median is in the middle of the sorted, so half bottom is equal to half top.
-- only works with odd numbers of rows

SELECT ROUND(S.LAT_N,4)
FROM STATION S
WHERE 
(SELECT COUNT(LAT_N)
FROM STATION
WHERE LAT_N < S.LAT_N) = 
(SELECT COUNT(LAT_N)
 FROM STATION
WHERE LAT_N > S.LAT_N)
