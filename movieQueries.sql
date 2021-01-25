-- create table pentax(
-- COLUMN_name COLUMN_datatype optional constraint,
-- COLUMN_name COLUMN_datatype optional constraint,
-- ..............

-- COLUMN_name COLUMN_datatype optional constraint,
-- CONSTRAINT name_of_table_pk	PRIMARY KEY(column_name)
-- CONSTRAINT name_of_table_fk	FOREIGN KEY(column_name)
-- 							REFERENCES table_name(column_name)
-- );

create table actor(
	act_id	int	not null auto_increment,
    act_fname	char(20)	not null,
    act_lname	char(20)	not null,
    act_gender	char(1)		not null,
    constraint	actor_pk	primary key(act_id)
);
create table movie(
	mov_id	int	not null,
    mov_title	char(50)	not null,
    mov_year	int	not null,
    mov_time	int	not null,
    mov_lang	char(50)	not null,
    mov_dt_rel	date	not null,
    mov_rel_country	char(5)	not null,
    constraint	movie_pk	primary key(mov_id)
);
Alter table movie
modify column mov_lang char(50)	not null,
modify column mov_dt_rel date null;


create table	reviewer(
	rev_id	int	not null,
    rev_name	char(30)	not null,
    constraint	reviewer_pk	primary key(rev_id)
);

alter table reviewer
modify column rev_name char(30) null;
create	table	genres(
	gen_id	int	not	null,
    gen_title	char(20)	not null,
    constraint	genres_pk	primary key(gen_id)
);
create	table	director(
	dir_id	int	not	null,
	dir_fname	char(20)	not null,
    dir_lname	char(20)	not null,
    constraint	dir_pk	primary key(dir_id)
);
create table movie_direction(
	dir_id	int	not null,
    mov_id	int	not null,
    constraint	movieDir_fk1	foreign key(dir_id)
							references	director(dir_id),
	constraint	movieDir_fk2	foreign key(mov_id)
							references	movie(mov_id)
);

create table movie_cast(
	act_id	int	not null,
    mov_id	int	not null,
    mov_role	char(30)	not null,
    
    constraint	movieCast1_fk1	foreign key(mov_id)
							references	movie(mov_id),
	constraint	movieCast1_fk2	foreign key(act_id)
							references	actor(act_id)
);
create table movie_genre(
	gen_id	int	not null,
    mov_id	int	not null,

    constraint	movieGenre_fk1	foreign key(mov_id)
							references	movie(mov_id),
	constraint	movieGenres_fk2	foreign key(gen_id)
							references	genres(gen_id)
);
create table rating(
	rev_id	int	not null,
    mov_id	int	not null,
    rev_stars	char(30)	null,
    num_o_ratings	char(30) null,
    
    constraint	rating_fk1	foreign key(rev_id)
							references	reviewer(rev_id),
	constraint	rating_fk2	foreign key(mov_id)
							references	movie(mov_id)
);


alter table rating
modify column rev_stars decimal(4,2) null,
modify num_o_ratings	int null
