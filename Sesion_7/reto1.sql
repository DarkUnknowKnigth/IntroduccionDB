-- crear db --
create database if not exists etesech;
-- borrar db --
drop database if exists etesech;
use etesech;
-- crear tabla users --
create table if not exists users(
	user_id int primary key,
    gender char(1),
    age int,
    occupation int,
    zipcode varchar(20)	
);
-- borrar tabla --
drop table if exists users;

-- crear tabla movies --
create table if not exists movies(
	movie_id int primary key, 
	title varchar(100), 
	genres varchar(100)
);

drop table if exists movies;

-- crear tabla ratings --
create table if not exists ratings(
	user_id int,
	movie_id int,
	rating int,
	rated_at bigint
    -- ,
    -- foreign key (user_id) references users(user_id),
	-- foreign key (movie_id) references movies(user_id)
);
drop table if exists ratings;
select * from users;
select * from ratings;
select * from movies;