CREATE VIEW ten_year_cagr AS(

WITH decade_cagr AS(

SELECT
c.iso_code,
i.indicator,
o.year,
LAG(o.year) OVER(PARTITION BY c.iso_code, i.indicator ORDER BY year) AS first_year,
value,
LAG(o.value) OVER(PARTITION BY c.iso_code, i.indicator ORDER BY year) AS first_value

FROM observations o 
JOIN countries c ON o.country_id=c.id
JOIN indicators i ON o.indicator_id=i.id

WHERE o.year%10=0

)

SELECT *,
ROUND(POWER(1.00*value/first_value,1.00/10)-1,4) AS cagr

FROM decade_cagr 

WHERE first_year IS NOT NULL 
AND first_value IS NOT NULL 
AND value IS NOT NULL


);


 