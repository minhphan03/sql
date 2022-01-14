-- we can do comparisons (submission score = difficulty max score) right in the joins using the conditions to eliminate submissions

SELECT
    H.hacker_id, H.name
FROM
    Submissions S 
    JOIN Challenges C on C.challenge_id = S.challenge_id
    JOIN Difficulty D on D.difficulty_level = C.difficulty_level AND D.score = S.score
    JOIN Hackers H on H.hacker_id = S.hacker_id 
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.hacker_id) > 1 
ORDER BY COUNT(S.hacker_id) DESC, H.hacker_id asc
