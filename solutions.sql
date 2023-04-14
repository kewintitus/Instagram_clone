
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
    
    
    
    
-- Query to get most liked photo with user details

SELECT 
    username, photo_id, COUNT(*) AS like_count
FROM
    likes
        JOIN
    photos ON photos.id = photo_id
        JOIN
    users ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY like_count DESC limit 1;

-- Calculate avg no of photos per user 

SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users);
            
-- 5 most commonly used hashtags

SELECT 
    tag_id, tag_name, COUNT(*) AS tag_count
FROM
    photo_tags
        JOIN
    tags ON tags.id = tag_id
GROUP BY tag_id
ORDER BY tag_count DESC limit 5;

-- finding bot user acccounts - users who  have liked every single post
select * from users;

 SELECT 
    likes.user_id, username, COUNT(*) AS like_count
FROM
    likes
        JOIN
    users ON users.id = likes.user_id
        JOIN
    photos ON photos.id = likes.photo_id
GROUP BY likes.user_id
HAVING like_count = (SELECT 
        COUNT(*)
    FROM
        photos);
	