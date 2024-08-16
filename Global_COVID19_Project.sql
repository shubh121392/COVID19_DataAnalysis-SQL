SELECT * FROM global_covid19.covid19;

-- 1. Retrieve the total number of confirmed cases for each country.
select Country, confirmed as Total_confirmed_cases from covid19;


-- 2. List the countries with more than 10,000 confirmed cases.
select Country from covid19
where confirmed > '10,000';


-- 3. Calculate the total number of deaths worldwide.
select sum(deaths) as Total_deaths from covid19;


-- 4. Find the top 5 countries with the highest number of recovered cases.
select country, recovered from covid19
order by recovered desc
limit 5;


-- 5. Display the countries with no new deaths reported.
select country from covid19
where new_deaths = '0';


-- 6. Calculate the death rate (Deaths / Confirmed) for each country and list the top 10 countries with the highest death rate.
select country, (deaths/Confirmed)* 100 as Death_rate from covid19
order by Death_rate desc
limit 10;


-- 7. Find the countries with an active case count greater than the recovered case count.
select country, active as active_case, recovered as recovered_case from covid19
where active > recovered;


-- 8. Determine the WHO region with the most confirmed cases.
select WHO_region, sum(confirmed) as Highest_confirmed
from covid19
group by WHO_Region
order by Highest_confirmed desc
limit 1;


-- 9. List all countries where the percentage increase in confirmed cases over the last week is greater than 20%.
select country, One_week_percent_increase from covid19
where One_week_percent_increase > '20'
order by One_week_percent_increase desc;


-- 10. Retrieve the average number of new cases across all countries.
select country, round(avg(new_cases),0) as Average_cases from covid19
group by country; 


-- 11. List countries where the number of deaths per 100 recovered cases is greater than 10.
select country, Deaths_per_Hundred_Cases from covid19
where Deaths_per_Hundred_Cases > '10'
order by Deaths_per_Hundred_Cases desc;


-- 12. Identify countries where the number of new recovered cases is greater than the number of new cases.
select Country, New_recovered as New_Recovered_Cases from covid19
where New_recovered > new_cases
order by New_Recovered_Cases desc;


-- 13. Calculate the total number of active cases in the WHO Europe region.
select WHO_Region, sum(active) as Total_Active_Cases from covid19
where WHO_Region = 'Europe';


-- 14. Determine the top 3 countries with the highest increase in confirmed cases over the last week.
select country, One_week_change from covid19
order by One_week_change desc
limit 3; 


-- 15. List all countries where the death rate (Deaths / Confirmed) is less than 1%.
select country, (deaths/confirmed)*100 as Death_Rate from covid19
where (deaths/confirmed)*100 < '1';

-- OR

select country, (deaths/confirmed)*100 as Death_Rate from covid19
Having Death_Rate < '1';
