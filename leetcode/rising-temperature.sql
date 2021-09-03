# Write your MySQL query statement below
SELECT Weather.id
FROM Weather
INNER JOIN WEATHER W
ON W.RecordDate = DATE_SUB(Weather.RecordDate, INTERVAL 1 DAY) AND Weather.Temperature > W.Temperature
