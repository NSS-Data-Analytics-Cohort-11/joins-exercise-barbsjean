-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT
	specs.film_title,
	specs.release_year,
	MIN(revenue.worldwide_gross) AS min_to_max_worldwide_gross
FROM specs
	FULL JOIN revenue
	ON specs.movie_id = revenue.movie_id
GROUP BY 
	specs.film_title,
	specs.release_year
ORDER BY min_to_max_worldwide_gross;

--Answer: Semi-Tough; 1977; 37,187,139

******************************************************

-- 2. What year has the highest average imdb rating?

SELECT
	specs.release_year,
	(AVG(imdb_rating)) AS avg_imdb_rating
FROM specs
	INNER JOIN rating
	ON specs.movie_id = rating.movie_id
GROUP BY 
	specs.release_year
ORDER BY avg_imdb_rating DESC;

--ANSWER: 1991
	
******************************************************

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
	
SELECT 
	specs.film_title,
	specs.mpaa_rating,
	revenue.worldwide_gross,
	distributors.company_name
FROM revenue
	INNER JOIN specs
	ON revenue.movie_id = specs.movie_id
	INNER JOIN distributors
	ON specs.domestic_distributor_id = distributors.distributor_id
WHERE mpaa_rating = 'G'
ORDER BY worldwide_gross DESC;

--ANSWER: Toy Story 4. Walt Disney.

******************************************************

--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

SELECT 
	distributors.company_name as distributor,
	COUNT(specs.movie_id)
FROM distributors
	FULL JOIN specs
	ON distributors.distributor_id = specs.domestic_distributor_id
GROUP BY distributors.company_name;

******************************************************

-- 5. Write a query that returns the five distributors with the highest average movie budget.

SELECT
	company_name as distributors,
	AVG(film_budget) as movie_budget
FROM distributors
	INNER JOIN specs
	ON distributors.distributor_id = specs.domestic_distributor_id
	INNER JOIN revenue
	on specs.movie_id = revenue.movie_id
GROUP BY distributors
ORDER BY movie_budget DESC
LIMIT 5;

-- ANSWER: Walt Disney, Sony Pictures, Lionsgate, DreamWorks, Warner Bros. 
	
******************************************************

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
	
	



