
-- Find the Best-Picture winner with the best/smallest earnings rank. The
-- result should have the form (name, earnings_rank). Assume no two movies
-- have the same earnings rank.

SELECT name , earnings_rank
FROM movie
ORDER BY earnings_rank ASC , rating DESC
LIMIT 1
