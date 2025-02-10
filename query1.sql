-- Retrieve all columns from the country table
use world;
select * from country;

-- Retrieve all columns from the city table
use world;
select * from city;

-- Retrieve all columns from the countrylanguage table
use world;
select * from countrylanguage;

-- List the names of all countries
use world;
select name from country;

-- Find the population of a specific country (e.g., 'India')
use world;
select population  from country where name = 'India';

-- List all countries in the continent of 'Asia'
use world;
select Name from country where Continent = 'Asia';

-- Sort all countries by their population in descending order.
use world;
select name, population from country order by population Desc; 

-- Find the total number of countries in the dataset
use world;
select count(*) as totalNum from country;

-- Find the largest populations among all countries.
use world;
select name, population as largestPopulation 
from country 
order by population Desc
limit 1; 

-- -- Find the smallest populations among all countries.
use world;
select name, population from country 
order by population asc
limit 1;


-- Find the average population of all countries.
use world;
select sum(population)/count(population) as averagePopulation from country;

-- other version 
use world;
select avg(population) from country;


-- List the top 5 most populous countries.
use world;
select name, population from country
order by population desc
limit 5;

-- Find the total population of all countries in the continent of 'Europe'.
use world;
select sum(population) as populationInEurope from country
where continent = 'Europe';


-- Count the number of countries in each continent.
use world;
select continent, count(*) as numOfCountries from country group by continent;

-- Find the capital city of a specific country (e.g., 'Japan').
use world; 
select city.name as capital
from country 
join city on country.capital = city.id
where country.name= 'Iran';


-- List all cities with a population greater than 1 million.
use world;
select name, population from city where population > 1000000;

-- Find the country with the highest GDP.
use world;
select name, gnp from country
order by gnp desc limit 1;

--  Find the top 3 continents by total population.
use world;
select sum(population), continent as totalPopulationInEachContinent
from country 
group by continent ;

-- List all countries and their official languages.
use world;
select country.name, countrylanguage.language
from country
inner join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.isofficial = 'T';



-- Calculate the density (population per square kilometer) for each country.
use world;
select name, round(population/surfacearea, 2) as density from country
where surfacearea > 0;


-- Find the country with the highest number of official languages.
use world;
select country.name, count(countrylanguage.language) as numberOfLanguages, countrylanguage.countrycode
from country
inner join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.isofficial = 'T'
group by countrylanguage.countrycode
order by numberOfLanguages desc
limit 1;

-- List all cities along with their country names.
use world;
select country.name, city.name 
from country 
inner join city on country.code = city.countrycode ;


-- Find the country with the highest number of cities with a population greater than 500,000.
use world;
select count(city.countrycode) as numberOfCities, country.name
from country
inner join city on country.code = city.countrycode
where city.population > 500000
group by country.name
limit 1 ;


-- Calculate the percentage of the world's population living in each continent.
use world;
select continent, sum(population) as eachContinentPopulation, round((sum(population)/(select sum(population) from country))*100, 2) as percentage
from country
group by continent ;


-- Find the continent with the most countries having a life expectancy greater than 75 years.
select continent, count(name) as countries from country
where lifeexpectancy > 75
group by continent
order by countries desc
limit 1;

-- List all countries that share the same independence year as 'India'.
use world;
select name from country
where indepyear = (select indepyear from country where name = 'india') and name != 'india'

