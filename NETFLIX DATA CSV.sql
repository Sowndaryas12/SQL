use netflix;
select * from credits;
select * from titles;

/*1.what were the top 10 movies according to IMDB score?*/
select title, imdb_score from titles
order by imdb_score desc
limit 10;

/*2.what were the top 10 shows according to IMDB score?*/
select type, imdb_score from titles
where type = 'SHOW'
order by imdb_score desc
limit 10;

/*3.what were the BOTTOM 10 movies according to IMDB score?*/
select title, imdb_score from titles
order by imdb_score asc
limit 10;

/*4.What were the bottom 10 shows according to IMDB score?*/
select type, imdb_score from titles
where type = 'SHOW'
order by imdb_score asc
limit 10;

/*5.What were the average IMDB and TMDB scores for shows and movies?*/
select type, avg(imdb_score)as avg_imdb_score ,avg(tmdb_score)as avg_tmdb_score from titles
group by type;

/*6.Count of movies and shows in each decade?*/
select type, count(*) from titles
group by type;

/*7. What were the average IMDB and TMDB scores for each production country?*/
select group_concat(production_countries separator "|") as countries_name, round(avg(imdb_score),2)as avg_imdb_score ,round(avg(tmdb_score),2)as avg_tmdb_score 
from titles
group by production_countries;

select * from titles;

/*8.What were the average IMDB and TMDB scores for each age certification for shows and movies?*/
select age_certification,type, round(avg(imdb_score),2)as avg_imdb_score ,round(avg(tmdb_score),2)as avg_tmdb_score from titles
group by type,age_certification;

/*9.What were the 5 most common age certifications for movies?*/
select age_certification, count(*)as count from titles
where type = 'MOVIE'
group by age_certification
order by count desc
limit 5;
/*10.Who were the top 20 actors that appeared the most in movies/shows?*/
select c.name,count(t.type) as count_type
from titles as t
inner join credits as c
on t.id = c.id
group by c.name
order by count_type desc
limit 20;

/*11.Who were the top 5 directors that directed the most movies/shows?*/
select c.name,c.role,count(t.type) as count_type from titles as t
inner join credits as c
on t.id = c.id
where c.role = 'DIRECTOR'
group by c.role,c.name
order by count_type desc
limit 5;

/*12.Calculat the average runtime of movies and TV shows separately*/
select type,avg(runtime) as avg_runtime from titles
group by type;

/*13.Finding the titles and  directors of movies released on or after 1967*/
select t.title,t.type,c.role,t.release_year from titles as t
inner join credits as c
on t.id = c.id
where c.role="DIRECTOR" and release_year>=1967;

/*14.Which shows on Netflix have the most seasons?*/
select title,type,seasons from titles
where type = 'SHOW'
order by seasons desc
limit 10;

/*15.Which genres had the most movies?*/
select genres,count(title) as count_title,type from titles
where type = 'MOVIE'
group by genres
order by count_title desc;

/*16.Which genres had the most shows?*/
select genres,count(title) as count_title,type from titles
where type = 'SHOW'
group by genres
order by count_title desc;

/*17.Titles and Directors of movies with high IMDB scores (>7.5) and high TMDB popularity scores (>15)*/
select t.title,c.role,t.type,t.imdb_score,t.tmdb_popularity from titles as t
inner join credits as c
on t.id = c.id
where c.role = 'DIRECTOR' and t.imdb_score >7.5 and t.tmdb_popularity >15;

/*18. What were the total number of titles for each year?*/
select count(title)as count_title, release_year from titles
group by release_year
order by count_title desc;

/*19. Actors who have starred in the most highly rated movies or shows*/
select c.name,c.role,t.type,t.imdb_score,t.tmdb_score
from titles as t
inner join credits as c
on t.id = c.id
where c.role = 'ACTOR' and t.imdb_score >7.5 and t.tmdb_score >8
order by t.tmdb_score desc
limit 10;

/*20. Which actors/actresses played the same character in multiple movies or TV shows?*/
select c.name, c.character, count(*) as count_character
from titles as t
inner join credits as c
on t.id = c.id
where c.role = 'ACTOR'
group by c.name, c.character
having count(*) > 1
order by count_character desc;

/*21. What were the top 3 most common genres?*/
select genres, count(*) as genres_count 
from titles 
group by genres
order by genres_count desc
limit 3;

/*22. Average IMDB score for leading actors/actresses in movies or shows */
select c.name, avg(t.imdb_score) as avg_imdb_score 
from titles t
inner join credits c
on t.id = c.id
where c.name = 'leading' and c.role = 'ACTOR'
group by c.name 
order by avg_imdb_score desc;

select * from credits;
select * from titles;




