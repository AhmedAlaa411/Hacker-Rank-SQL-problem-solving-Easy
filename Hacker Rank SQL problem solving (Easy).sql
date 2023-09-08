 --Weather Observation Station 10
 --هنا عايزين نختار المدن بدون تكرار فهنستخدم Distinct
 --بعدها عايزين نجيب المدن الي بتنتهي بحرف مش متحرك فهنستعمل not like 
 -- و علامة النسبه المئوية في الشمال علشان نجيب اخر حرف 
 -- ممكن نستعمل ال sub string بس مش هيبقي احسن طريقه 
select distinct city from station where city not like '%[AEIOU]' ;

--Weather Observation Station 11
--نفس كلام الي فوق بس هنا مش عايزين الحرف المتحرك في الاول او الاخر 
select distinct city from station where city not like '%[AEIOU]' or city not like '[AEIOU]%' ; 

--Weather Observation Station 12
-- هنا هنحذف المدن الي بتبدا و بتنتهي بحرف متحرك في نفس الوقت زي America 
select distinct city from station where city not like '%[AEIOU]' and city not like '[AEIOU]%' ; 

--Higher Than 75 Marks
-- الفكره هنا اننا نفلتر بنائا علي الدرجات بس و نرتبهم 
select students.name from students where students.marks > 75 order by right(students.name ,3) , id ; 

--Employee Names

select name from employee order by name asc; 

--Employees salaries
select name from employee where salary > 2000 and months <10 order by employee_id asc; 


--Types of triangle 
SELECT
  CASE 
    WHEN A + B <= C or A + C <= B or B + C <= A THEN 'Not A Triangle'
    WHEN A = B and B = C THEN 'Equilateral'
    WHEN A = B or A = C or B = C THEN 'Isosceles'
    WHEN A <> B and B <> C THEN 'Scalene'
  END tuple
FROM TRIANGLES; 

--Revising Aggregations - The Count Function
--We can use name too
select count(id) from city where population > 100000; 

--Revising Aggregations - The Sum Function
select sum(population) from city where district ='California'; 

--Revising Aggregations - Averages
select avg(population) from city where district ='California'; 

--Average Population
select convert(int, avg(population)) from city ; 

--Japan Population
select sum(population) from city where countrycode = 'jpn'; 

--Population Density Difference
select max(population) - min(population) from city ; 

--Top Earners
select 
(select max(salary * months) from employee) , 
count(*) from employee 
where salary * months = (select max(salary * months) from employee)

-- Weather Observation Station 2
select format(sum (LAT_N ),'0.00') , format(sum (LONG_W),'0.00') from station;

--Weather Observation Station 13
select format (sum(LAT_N),'0.0000')
from station 
where LAT_N > 38.7880 and LAT_N< 137.2345

--Weather Observation Station 14
select format (max(LAT_N),'0.0000')
from station 
where LAT_N < 137.2345

--Weather Observation Station 15
select format (long_w,'0.0000') from station 
where lat_n = (select max(LAT_N)from station 
where LAT_N < 137.2345);

--Weather Observation Station 16
select format(min(lat_n),'0.0000')
from station 
where lat_n > 38.7780

--Weather Observation Station 17
select format (long_w,'0.0000') from station 
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);

--African Cities
select city.name
from city join country
on city.countrycode = country.code
where country.continent = 'Africa'

--Average Population of Each Continent
select COUNTRY.Continent ,floor(avg(CITY.Population))
from city join country
on city.countrycode = country.code
GROUP BY COUNTRY.Continent