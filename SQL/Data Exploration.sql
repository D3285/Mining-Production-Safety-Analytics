-- Which mine has the highest total production? 
SELECT 
    Mine_Name, SUM(Production_Tons) AS Total_Production
FROM
    mining.`mining_sample_dataset 2`
GROUP BY Mine_Name
ORDER BY Total_Production DESC;

-- Which mine has the lowest total production? 
SELECT Mine_Name,
	avg(Production_Tons) AS Average_Production
FROM mining.`mining_sample_dataset 2`
GROUP BY Mine_Name
ORDER BY Average_Production DESC;

select Shift, SUM(Production_Tons) AS Total_Production
FROM mining.`mining_sample_dataset 2`
group by Shift
order by Total_Production Desc
Limit 1 ; 
-- Which shift produces the lowest output? ''
select Shift, SUM(Production_Tons) AS Total_Production
FROM mining.`mining_sample_dataset 2`
group by Shift
order by Total_Production asc
Limit 1 ; 

-- Which shift produces the highest output?''
select Shift, SUM(Production_Tons) AS Total_Production
FROM mining.`mining_sample_dataset 2`
group by Shift
order by Total_Production desc
Limit 1 ; 

-- What is the production contribution (%) of each mine? '' 

SELECT 
    Mine_Name,
    SUM(Production_Tons) AS Mine_Production,
    ROUND(SUM(Production_Tons) * 100 / (SELECT 
                    SUM(Production_Tons)
                FROM
                    mining.`mining_sample_dataset 2`),
            2) AS Production_Contribution_Percentage
FROM
    mining.`mining_sample_dataset 2`
GROUP BY Mine_Name
ORDER BY Production_Contribution_Percentage DESC;

-- What is the monthly production trend?

SELECT 
    MONTH(Date) AS Month,
    SUM(Production_Tons) AS Monthly_Production
FROM
    mining.`mining_sample_dataset 2`
GROUP BY MONTH(Date)
ORDER BY Monthly_Production DESC;

-- Which day recorded the highest production?
SELECT 
    DAY(date), Production_Tons
FROM
    mining.`mining_sample_dataset 2`
ORDER BY Production_Tons DESC
LIMIT 1; 

-- Which day recorded the lowest production?

SELECT 
    DAY(date), Production_Tons
FROM
    mining.`mining_sample_dataset 2`
ORDER BY Production_Tons ASC
LIMIT 1; 

-- Which mine consistently performs above average?

select Mine_Name , Production_Tons
from mining.`mining_sample_dataset 2`
group by Mine_Name 
Having Production_Tons > (
    SELECT AVG(Production_Tons)
    FROM mining.`mining_sample_dataset 2`
) ;

-- Which equipment has the highest downtime?

SELECT 
    Equipment_Id, Downtime_Hours
FROM
    mining.`mining_sample_dataset 2`
ORDER BY Downtime_Hours DESC; 

-- What is the average downtime per equipment?

select  avg(Downtime_Hours) as Average_Downtime
from mining.`mining_sample_dataset 2` ;

-- Which equipment contributes the most production?

select Equipment_Id , Production_Tons
from mining.`mining_sample_dataset 2`
order by Production_Tons
limit 1 ; 

-- Which accident type occurs most frequently?


SELECT 
    Accident_Type, COUNT(*) AS Accident_Count
FROM
    mining.`mining_sample_dataset 2`
GROUP BY Accident_Type
ORDER BY Accident_Count DESC
LIMIT 1;

-- Which mine has the highest number of accidents?
select Mine_Name , count(Accident_Type) as accident
from mining.`mining_sample_dataset 2`
group by Mine_Name
order by accident desc
limit 1 ;

-- What is the monthly accident trend?
select   COUNT(*) AS Total_Accidents , month(Date) as Months
from mining.`mining_sample_dataset 2`
group by  Month(Date)
order by Months ;

-- Which accident type should be targeted first for prevention?
select Accident_Type, count(*) as Mostly_Accident
from mining.`mining_sample_dataset 2`
group by Accident_Type
order by Mostly_Accident desc
limit 1;

-- Which mine has the worst overall performance?
SELECT
    Mine_Name,
    SUM(Production_Tons) AS Total_Production
FROM mining.`mining_sample_dataset 2`
GROUP BY Mine_Name
ORDER BY Total_Production asc
LIMIT 1;

-- find the top 5 equipment with the highest downtime.
select Equipment_ID , sum(Downtime_Hours) as Total_Downtime
FROM mining.`mining_sample_dataset 2`
group by Equipment_ID
order by Total_Downtime desc
limit 5;
