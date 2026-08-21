/*Spain growth*/

SELECT * 

FROM growth 

WHERE 
  iso_code='ESP'
  AND indicator_code='NY.GDP.MKTP.CD';

/*Spain cumulatve CAGR*/

SELECT 
  g.year, 
 g.value,
 g.growth_index,
 g.growth_rate,
 c.first_year, 
 c.cagr

FROM 
  growth g 
  JOIN cagr c ON g.iso_code=c.iso_code 
  AND g.year=c.year 
  AND g.indicator_code=c.indicator_code

WHERE 
  g.iso_code='ESP' 
  AND g.indicator_code='NY.GDP.MKTP.CD';

/*Spain fixed ten-year CAGR*/

SELECT 
  first_year || '-' || year AS period,
  first_value AS initial_value,
  value AS final_value,
  cagr

FROM ten_year_cagr 

WHERE iso_code='ESP'

ORDER BY first_year;

/*Spain rolling ten-year CAGR*/

SELECT * 

FROM rolling_10_cagr 

WHERE iso_code='ESP';


