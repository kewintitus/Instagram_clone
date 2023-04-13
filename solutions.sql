
-- selecting 5 oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- finding the day of week most users registered for planning campaign
SELECT 
    DAYNAME(created_at) AS day_of_week, COUNT(*) AS no_of_users
FROM
    users
GROUP BY day_of_week
ORDER BY no_of_users DESC
LIMIT 1;

SELECT 
    username, users.id AS user_id, image_url
FROM
    photos
        RIGHT JOIN
    users ON users.id = photos.user_id
WHERE
    image_url IS NULL;