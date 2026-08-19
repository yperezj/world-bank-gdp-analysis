/*Calculate annual GDP growth rates and growth indexes.*/

CREATE VIEW growth AS(
  
  WITH year_comparison AS(
    
    SELECT 
      c.iso_code AS iso_code,
      i.code AS indicator_code,
      year,
      value,
      LAG(year) OVER(PARTITION BY country_id, indicator_id ORDER BY year) AS last_year,
      LAG(value) OVER(PARTITION BY country_id, indicator_id ORDER BY year) AS last_value

    FROM 
      observations o
      JOIN countries c ON o.country_id=c.id
      JOIN indicators i ON o.indicator_id=i.id)

SELECT 
  iso_code, 
  indicator_code,year, 
  value, 
  last_value,
  ROUND(100.00 * value / last_value,2) AS growth_index,
  ROUND(100.00 * (value - last_value) / last_value,2) AS growth_rate

FROM year_comparison


);
