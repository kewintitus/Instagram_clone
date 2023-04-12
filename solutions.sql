
-- selecting 5 oldest users
SELECT 
    *, TIMESTAMPDIFF(YEAR, created_at, NOW()) AS duration
FROM
    users
WHERE
    TIMESTAMPDIFF(YEAR, created_at, NOW()) > 3 order by created_at  limit 5;