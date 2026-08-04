

CREATE VIEW rolling_10_cagr AS(

WITH summary AS(

SELECT 
o.year AS year, 
o.value AS value, 
c.iso_code AS iso_code,
i.indicator AS indicator

FROM observations o 
JOIN countries c ON o.country_id=c.id 
JOIN indicators i ON o.indicator_id=i.id

)

SELECT 
s1.iso_code,
s1.indicator,
s1.year|| '-' || s2.year AS period,
s1.value AS initial_value,
s2.value AS final_value,
ROUND((POWER(s2.value/s1.value,1.00/10))-1,4)


FROM summary s1 
JOIN summary s2 ON s1.year+10=s2.year 
AND s1.iso_code=s2.iso_code
AND s1.indicator=s2.indicator

);