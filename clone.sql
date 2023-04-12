create database instagram;

use instagram;

create table users(
	id int auto_increment primary key,
    username varchar(255) unique not null,
    created_at timestamp default now()	
);

desc users;

create table photos(
	id integer auto_increment primary key, 
    image_url varchar(255) not null,
    user_id integer not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

create table comments(
	id int auto_increment primary key,
    comment_text varchar(255) not null,
    user_id integer not null,
    photo_id integer not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id )
);

create table likes (
	user_id integer not null,  
    photo_id integer not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id),
    foreign key (photo_id ) references photos(id),
    primary key(user_id, photo_id)
);

create table follows (
	follower_id integer not null,
    followee_id integer not null,
    created_at timestamp default now(),
    foreign key (follower_id) references users(id),
    foreign key (followee_id) references users(id),
    primary key(follower_id, followee_id)
);

create table tags (
	id integer auto_increment primary key,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);

create table photo_tags(
	photo_id integer not null,
    tag_id integer not null, 
    foreign key(photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key(photo_id, tag_id)
);


