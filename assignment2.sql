create table country2(
	country char(20),
	confirmed int,
	deaths int,
	recover int,
	active int,
	new_cases int,
	new_deaths int,
	new_recovered int,
	deathsPerhundcases float,
	recoveredPerhundcases float,
	deathsPerhundrecovered float,
	confirmedlastweek int,
	oneweekchange int,
	oneweekpercentchange float,
	whoregion char(30)
);

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Afghanistan',36263,1269,25198,9796,106,10,18,3.5,69.49,5.04,
	35526,737,2.07,'Eastern Mediterranean');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Brazil',2442375,87618,1846641,508116,23284,614,33728,3.59,75.61,4.74,
	2118646,323729,15.28,'Americas');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Canada',116458,8944,0,107514,682,11,0,7.68,0,0,112925
	,3533,3.13,'Americas');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Denmark',13761,613,12605,543,109,0,77,4.45,91.6,4.86,
	13453,308,2.29,'Europe');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Finland',7398,329,6920,149,5,0,0,4.45,93.54,4.75,
	7340,58,0.79,'Europe');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Egypt',92482,4652,34838,52992,420,46,1007,5.03,37.67,13.35,
	88402,4080,4.62,'Eastern Mediterranean');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Greece',4227,202,1374,2651,34,0,0,4.78,32.51,14.7,
	4012,215,5.36,'Europe');

insert into country2(country,confirmed,deaths,recover,active, new_cases,new_deaths,new_recovered,
	deathsPerhundcases,recoveredPerhundcases,deathsPerhundrecovered,confirmedlastweek,oneweekchange,
	oneweekpercentchange,whoregion) values('Hungary',4448,596,3329,523,13,0,0,13.4,74.84,17.9,
	4339,109,2.51,'Europe');

	
select * from country2;

SELECT country, ((deaths / confirmed) * 100) AS death_percentage
FROM country2;  

SELECT (SUM(deaths) / SUM(confirmed)) * 100 AS global_death_percentage
FROM country2;  


SELECT country, (confirmed / population) * 100 AS infected_percentage
FROM country2; 


SELECT (SUM(confirmed) / SUM(population)) * 100 AS global_infected_percentage
FROM country2; 


SELECT country, (confirmed / population) * 100 AS infection_rate
FROM country2
ORDER BY infection_rate DESC
LIMIT 10;


SELECT country, deaths
FROM country2
ORDER BY deaths DESC
LIMIT 10;  


SELECT whoregion, SUM(deaths) AS total_deaths
FROM country2
GROUP BY whoregion
ORDER BY total_deaths DESC;   



SELECT country, AVG(new_deaths) AS average_daily_deaths
FROM country2
GROUP BY country;


SELECT whoregion, AVG(new_deaths) AS average_daily_deaths
FROM country2
GROUP BY whoregion;



SELECT country, (confirmed / population) * 100 AS average_cases_percentage
FROM country2
ORDER BY average_cases_percentage DESC
LIMIT 10;


SELECT country, (confirmed / population) * 100 AS infection_rate
FROM country2
ORDER BY confirmed DESC, infection_rate DESC
LIMIT 10;


-- Using joins:

SELECT d.country, d.population, v.people_vaccinated
FROM country d
JOIN covid_vaccine v ON d.country = v.country;


SELECT v.country, v.vaccine_type, (v.people_vaccinated / d.population) * 100 AS vaccination_percentage
FROM covid_deaths d
JOIN covid_vaccine v ON d.country = v.country;


SELECT v.country, (v.people_fully_vaccinated / d.population) * 100 AS fully_vaccinated_percentage
FROM covid_deaths d
JOIN covid_vaccine v ON d.country = v.country;