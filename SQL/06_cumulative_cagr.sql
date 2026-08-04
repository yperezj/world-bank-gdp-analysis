CREATE VIEW cagr AS(

WITH cagr_info AS (

SELECT 
iso_code, 
indicator_code,
year, 
value, 
MIN(year) OVER (PARTITION BY iso_code, indicator_code) AS first_year

FROM growth

WHERE value IS NOT NULL),

cagr_info_2 AS(

SELECT 
iso_code, 
indicator_code,
first_year,
SUM(value) FILTER (WHERE year=first_year) AS first_value

FROM cagr_info

GROUP BY iso_code, first_year, indicator_code)

SELECT 
c1.iso_code, 
c1.indicator_code,
c1.first_year,
c1.year,
c2.first_value,
c1.value,
CASE WHEN 
c1.year-c1.first_year=0 THEN NULL 
ELSE
ROUND(POWER((1.00*c1.value/c2.first_value),1.00/(c1.year-c1.first_year))-1,4) 
END AS cagr

FROM cagr_info c1 
JOIN cagr_info_2 c2 
ON c1.iso_code=c2.iso_code 
AND c1.indicator_code=c2.indicator_code

);

