/*Filling in first step created tables with pib and unpivot_pib tables data*/

INSERT INTO countries (name,iso_code)

SELECT 
DISTINCT "Country Name",
"Country Code"

FROM pib

;



INSERT INTO indicators (indicator, code)

SELECT DISTINCT "Indicator Name",
"Indicator Code"

FROM pib;



INSERT INTO observaciones(country_id, indicator_id, year, value)

SELECT c.id, i.id, n.year, n.value 

FROM unpivot_pib n LEFT JOIN countries c ON n.country=c.name
LEFT JOIN indicators i ON n.ind=i.indicator;
