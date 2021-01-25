
-- question 1
-- write a query in SQL to find the name and year of the movies

  select mov_title, mov_year
  from movie;

  -- Question 2
  -- Write a query in SQL to find the year when the movie American Beauty was released
  
  select mov_year, mov_title
  from movie
  where mov_title = 'American Beauty';
  
  -- Question 3 
  -- Write a query in SQL to find the movie which was released in the year 1999
  
  select * from movie
  where mov_year = 1999;
  
  
  -- Question 4
  -- Write a query in SQL to find the movie which was released in the year 1998
  
  select * from movie
  where mov_year < 1998;
  
  -- Question 5
  -- Write a query in SQL to find the movie which was released before 1999
  
  select * from movie
  where mov_year < 1999;
  
-- Question 6
-- Write a query in SQL to return the name of all reviewers and name of movies together in a single
-- list

  select rev_name, mov_title 
  from reviewer, movie;
  
-- Question 7 
-- Write a query in SQL to find the name of all reviewers who have rated 7 or more stars to their rating

select distinct rev_name
from rating, reviewer
where rev_stars >= 7.00
and 
rating.rev_id = rating.rev_id;

-- Question 8
-- Write a query in SQL to find the titles of all movies that have no ratings.

select  mov_title
from movie, rating
where num_o_ratings is null
and
rating.mov_id = movie.mov_id
order by rev_stars;

-- Question 9
-- Write a query in SQL to find the name of all reviewers who have rated their ratings with a NULL
-- value

select distinct rev_name, rev_stars
from rating, reviewer
where rev_stars is null
and
rating.rev_id = reviewer.rev_id;

-- Question 10
-- Write a query in SQL to find the name of movie and director (first and last names) who directed a
-- movie that casted a role for 'Eyes Wide Shut'.

select mov_title, dir_fname, dir_lname, director.dir_id
from 
movie, director, movie_direction
where
mov_title = 'Eyes Wide Shut'
and
movie_direction.dir_id = director.dir_id
and 
movie_direction.mov_id = movie.mov_id;
