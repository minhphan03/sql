SET @N:= 0;
SELECT COUNT(*) FROM STATION INTO @TOTAL;

SELECT
    ROUND(AVG(A.LAT_N),4)
FROM
-- create a new table that includes only rank (row id) and LAT_N
    (SELECT @N := @N +1 AS ROW_ID, LAT_N 
    FROM STATION
    ORDER BY LAT_N) A
WHERE
-- from the above table, query the things we need:
    CASE WHEN MOD(@TOTAL,2) = 0
    
    -- if the row number is even, choose row ids that only in middle and middle+1
    THEN A.ROW_ID IN (@TOTAL/2, (@TOTAL/2+1))
    
    -- else (if row number is odd) return only the middle row number
    ELSE A.ROW_ID = (@TOTAL+1)/2
    END
