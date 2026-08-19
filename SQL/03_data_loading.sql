/*Populate the tables created in the first step using data from pib and unpivot_pib.*/

INSERT INTO countries (name,iso_code)

SELECT 
  DISTINCT "Country Name",
  "Country Code"

FROM pib;


INSERT INTO indicators (indicator, code)

SELECT 
  DISTINCT "Indicator Name",
  "Indicator Code"

FROM pib;


INSERT INTO observations (country_id, indicator_id, year, value)

SELECT 
  c.id, 
  i.id, 
  n.year, 
  n.value 

FROM 
  unpivot_pib n 
  INNER JOIN countries c ON n.country=c.name
  INNER JOIN indicators i ON n.ind=i.indicator;
