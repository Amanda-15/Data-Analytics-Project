-- COVID-19 Impact on Students Education, Social Life and Mental Health

-- Displays the whole table for Covid-19 
SELECT * FROM practical.covid_19_alt;

-- Displays the amount of students 1179
SELECT count(Age_of_Subject) AS 'Amount of Students'
FROM practical.covid_19_alt;

-- Displays the minimum, maximum and average age of student
-- Minimum age of student is 7
-- Maximum age of student is 59
-- Average age of student is 20
SELECT min(Age_of_Subject) AS 'Minimum Age of Student', max(Age_of_Subject) AS 'Maximum Age of Student',
avg(Age_of_Subject) AS 'Average Age of Student'
FROM practical.covid_19_alt;

-- Find the average time spent on online class a day, group by age
-- 7-17 average time spent on online class is 4.4 hours
-- 18-22 average time spent on online class is 2.8 hours
-- 23-59 average time spent on online class is 2.8 hours
-- Overall 7-17 year olds on average spent more time on online classes
SELECT  CASE WHEN Age_of_Subject < 18 THEN 'BETWEEN 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
count(Age_of_Subject) AS' Age Count', avg(Time_spent_on_Online_Class) 
AS 'Average time Spent Online', avg(Time_spent_on_self_study) As'Average time spent on self study'
FROM practical.covid_19_alt
GROUP BY 1;


-- Does change in weight lead to health issues during lockdown?
-- Display all students who have experienced health issues during lockdown 
-- There was no trend, nothing to indicate that health issues increased during lockdown
-- Overall, according to the data most students had the least amount of health issues despite the change in weight

SELECT Change_in_your_weight As'Change in your weight', Health_issue_during_lockdown AS 'Health Issues',  
count(Health_issue_during_lockdown) AS 'Health Issues During Lockdown'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- Does change in weight lead to health issues during lockdown?
-- Display all students who have experienced health issues during lockdwon
-- to see if the amount of sleep they had played a factor
-- According to the data the change in weight hasn't affected the average sleep 
-- it's not that different from other students
-- students whose weight remained constant had no health issues the average sleep was 7.8 hours
-- students whose weight remained constant had health issues the average sleep was 7.8 hours

SELECT Health_issue_during_lockdown, Change_in_your_weight,
avg(Time_spent_on_sleep) AS 'Average Sleep'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- Is there a link between Time spent on Social Media Vs Sleep Vs Fitness?
-- Could be a link as 7-17 spent more time on fitness
-- Whereas 18-22 spent more time on social media, less time on fitness and more time was spent sleeping

SELECT 
CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
avg(Time_spent_on_sleep) AS 'Average time spent Sleeping',
avg(Time_spent_on_fitness) AS 'Average time spent on Fitness', avg(Time_spent_on_social_media) AS 'Average time spent on Social Media'
FROM practical.covid_19_alt
GROUP BY 1
ORDER BY 1;

-- Displays the rating of the online class experience including the count of online class experience

SELECT  CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
Rating_of_Online_Class_experience AS 'Rating Online Class Experience',
count(Rating_of_Online_Class_experience) AS 'Count Rating Online Class Experience'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- This displays average age of student, count on what the students used as a way to cope with stress during the lockdown
SELECT avg(Age_of_Subject) AS 'Average Age', Stress_busters, count(Stress_busters) AS 'Total Stress Busters'
FROM practical.covid_19_alt
GROUP BY Stress_busters
ORDER BY 2;


-- This displays students WHERE the Stress Buster inlcudes the word LIKE music
-- Aged 18-22, 276 Students listened only to music 
-- compared to 1 student Aged 18-22 listened to music and scrolling down social media

SELECT CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
Stress_busters, count(Stress_busters) AS 'Total Stress Busters', (Age_of_Subject) AS 'Count of Students'
FROM practical.covid_19_alt
WHERE Stress_busters LIKE '%music%'
GROUP BY Stress_busters,2
ORDER BY 2;



-- This CASE WHEN displays the ages with the medium used for online class and a count of Medium Online Class
-- 7-17 year old. 181 tudents spent the majority of their time using a Smartphone for online classes
-- 18-22 year old. 356 students spent the majority of their time using a Laptop/Desktop for online classes 
-- 23-59 year old. 108 students spent the majority of their time using a Laptop/Desktop for online classes

SELECT  CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
Medium_for_online_class AS 'Medium Online Class',
count(Medium_for_online_class) AS 'Count of Medium Online Class'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- Find the age of subject and the social media platform used
-- In total 352 students preferred Instagram
-- In total 337 students preferred WhatsApp
-- In total 314 students preferred YouTube

SELECT CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
Prefered_social_media_platform AS 'Preferred Social Media Platform',
count(Prefered_social_media_platform) AS 'Count of Preferred Social Media Platform'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- Did students connect with family?

SELECT  CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
connected_with_family AS 'Connected with family',
count(connected_with_family) AS 'Count connected with family'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

-- How students utilised their time
-- Data shows that 399 students 18-22 year olds did not utilise their time

SELECT  CASE WHEN Age_of_Subject < 18 THEN 'Between 7 AND 17'
WHEN Age_of_Subject BETWEEN 18 AND 22 THEN 'Between 18 AND 22'
WHEN Age_of_Subject BETWEEN 23 AND 59 THEN 'Between 23 AND 59'
END 'Age brackets',
Time_utilized AS 'Time Utilised', connected_with_family AS 'Connected with family',
count(Time_utilized) AS 'Count of Time Utilised'
FROM practical.covid_19_alt
GROUP BY 1,2
ORDER BY 1;

