/*Create views to measure data continuity and historical depth*/

CREATE VIEW detailed_coverage AS(
	
	WITH coverage_data AS(
	
	  SELECT 
        MIN(year) AS first_year,
        ROUND(100.00 * COUNT(value) / (2025 - MIN(year) + 1),2) AS coverage_rate,
        country,
        c.iso_code,
        ind,
        i.code AS indicator_code

      FROM unpivot_pib n 
        JOIN countries c ON n.country = c.name
        JOIN indicators i ON n.ind=i.indicator

      WHERE value IS NOT NULL

      GROUP BY country, c.iso_code, ind, indicator_code)

SELECT
	country,
	iso_code, 
	ind,
	indicator_code,
	first_year, 
	coverage_rate,
CASE 
    WHEN coverage_rate=100 THEN 'full_coverage'
	WHEN coverage_rate<100 AND coverage_rate>=80 THEN 'high_coverage'
	WHEN coverage_rate<80 AND coverage_rate>=50 THEN 'medium_coverage'
	WHEN coverage_rate<50 AND coverage_rate>=30 THEN 'low_coverage'
	ELSE 'poor_coverage' END 
    AS coverage_quality	

FROM coverage_data

);


/*Summarized coverage data*/

CREATE VIEW summarized_coverage AS(
	
	SELECT 
	  iso_code,
	  indicator_code, 
	  coverage_rate, 
	  coverage_quality

FROM detailed_coverage

);


/*Historical depth of data*/

CREATE VIEW historical_depth AS(
	SELECT 
	iso_code,
	indicator,
	MIN(year) AS first_year,
	2025 - MIN(year) + 1 AS years_covered

FROM 
	observations o 
	JOIN countries c ON o.country_id=c.id 
	JOIN indicators i ON o.indicator_id=i.id

WHERE value IS NOT NULL

GROUP BY iso_code, indicator

);
