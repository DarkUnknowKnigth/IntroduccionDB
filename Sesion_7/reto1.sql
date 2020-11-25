
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
);
drop table if exists ratings;
