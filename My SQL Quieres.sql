## 1. What is the gender distribution of respondents from India?
select gender, count(*) as count
from milestone
where country = 'India'
group by gender;

## 2. What percentage of respondents from India are interested in education abroad and sponsorship?
select round(sum(Abroad_Education = 'Yes')/cast(count(*) as float), 4)*100 as percentage_of_respondents
from milestone
where country = 'India';

## 3. What are the 6 top influences on career aspirations for respondents in India?
SELECT DISTINCT Aspirational_job
FROM milestone
WHERE country = 'India'
ORDER BY Aspirational_job DESC
LIMIT 6;

## 4. How do career aspiration influences vary by gender in India?
select Influence_Factors, gender, count(*) as total_count
from milestone
where country = 'India'
group by gender, Influence_Factors
order by gender, Influence_Factors;

## 5. What percentage of respondents are willing to work for a company for at least 3 years?
select round(sum(Likelyhood_more_3years = 'Yes')/cast(count(*) as float), 4)*100 as percentage_of_respondents
from milestone
where country = 'India';

## 6. How many respondents prefer to work for socially impactful companies?
select  count(*) as total
from milestone
where Mission_is_not_clear = 'Yes';

## 7. How does the preference for socially impactful companies vary by gender?
SELECT gender, COUNT(*) AS total_respondents
FROM milestone
WHERE Mission_is_not_clear = 'Yes'
GROUP BY gender;

## 8. What is the distribution of minimum expected salary in the first three years among respondents?
SELECT Three_yearssalary, count(*) as totals
FROM milestone
GROUP BY Three_yearssalary
ORDER BY Three_yearssalary;

## 9. What is the expected minimum monthly salary in hand?
SELECT Expectations, count(*) as totals
FROM milestone
group by Expectations
ORDER BY Expectations;

## 10. What percentage of respondents prefer remote working?
select round(sum(Work_environment = 'Remote')/cast(count(*) as float), 4)*100 as percentage_of_respondents
from milestone;

## 11. What is the preferred number of daily work hours?
SELECT AVG(Work_in_Hours) AS daily_work_hours
FROM milestone;

SELECT Work_in_Hours, COUNT(*) AS daily_work_hours
FROM milestone
GROUP BY Work_in_Hours
ORDER BY Work_in_Hours;

## 12. What are the common work frustrations among respondents?
SELECT Daily_work, COUNT(*) AS number_of_respondents
FROM milestone
GROUP BY Daily_work
ORDER BY number_of_respondents DESC;

## 13. How does the need for work-life balance interventions vary by gender?
SELECT Lifebalance_months,
	   gender, 
       COUNT(*) AS total_respondents,
       SUM(Lifebalance_months) AS needs_intervention,
       (SUM(Lifebalance_months) / COUNT(*)) * 100 AS percentage_needs_intervention
FROM milestone
GROUP BY gender, Lifebalance_months
ORDER BY Lifebalance_months;

## 14. How many respondents are willing to work under an abusive manager?
SELECT COUNT(*) AS total_willing_respondents
FROM milestone
WHERE Workplace = 'Yes';

## 15. What is the distribution of minimum expected salary after five years?
SELECT Five_yearssalary, count(*) as totals
FROM milestone
group by Five_yearssalary
ORDER BY Five_yearssalary;

## 16. What are the remote working preferences by gender?
select Work_environment, gender, count(*) as totals
from milestone
where Work_environment = 'Remote'
group by Work_environment, gender
order by gender;

## 17. What are the top work frustrations for each gender?
SELECT gender, Daily_work, COUNT(*) AS number_of_respondents
FROM milestone
GROUP BY Daily_work, gender
ORDER BY  number_of_respondents, gender DESC;

## 18. What factors boost work happiness and productivity for respondents?
SELECT Productive_at_work, 
       COUNT(*) AS respondents
FROM milestone
GROUP BY Productive_at_work
ORDER BY respondents DESC;

## 19. What percentage of respondents need sponsorship for education abroad?
select round(sum(Abroad_Education = 'Yes')/cast(count(*) as float), 4)*100
from milestone;