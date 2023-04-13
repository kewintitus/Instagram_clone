
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
    
    
    
    
-- Query to get most liked photo

-- SELECT 
--     user_id, username, COUNT(*) AS photo_count
-- FROM
--     photos
--         JOIN
--     users ON users.id = user_id
-- GROUP BY user_id
-- ORDER BY photo_count DESC limit 1;

SELECT 
    username,photo_id, count(*) as like_count
FROM
    likes
    
        JOIN
    photos on photos.id = photo_id
    join users on users.id = photos.user_id
    group by photos.id order by like_count desc;