/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

SELECT DISTINCT continent, sum(population) over w1 as Population
FROM country
window w1 as (PARTITION by continent);

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT DISTINCT continent, sum(population::float) over w1 as Population,
 concat( 
    round(
        (sum(population::float) over w1 / sum(population::float) over()) * 100
     ), '%' ) as "Percentage of Population"
FROM country
window w1 as (PARTITION by continent);


/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

select distinct r.id, r.name, count(t.id) over (partition by r.id order by "r"."name") as towns from regions as r
join departments as d on d.code = r.code
join towns as t on d.code = t.department
order by r.id;