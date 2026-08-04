/*Helper query: we use generate series another time in order to create the content of VALUES function for the next 
step*/

SELECT '('|| gs || ',p."' || gs || '"),'
FROM generate_series(1960,2025) AS gs;


/Unpivoted table/
CREATE TABLE unpivot_pib AS(
SELECT 
p."Country Name" AS country,
p."Indicator Name" AS ind,
yv.year AS year,
yv.value AS value

FROM pib p CROSS JOIN LATERAL(
   
   VALUES 
(1960,p."1960"),
(1961,p."1961"),
(1962,p."1962"),
(1963,p."1963"),
(1964,p."1964"),
(1965,p."1965"),
(1966,p."1966"),
(1967,p."1967"),
(1968,p."1968"),
(1969,p."1969"),
(1970,p."1970"),
(1971,p."1971"),
(1972,p."1972"),
(1973,p."1973"),
(1974,p."1974"),
(1975,p."1975"),
(1976,p."1976"),
(1977,p."1977"),
(1978,p."1978"),
(1979,p."1979"),
(1980,p."1980"),
(1981,p."1981"),
(1982,p."1982"),
(1983,p."1983"),
(1984,p."1984"),
(1985,p."1985"),
(1986,p."1986"),
(1987,p."1987"),
(1988,p."1988"),
(1989,p."1989"),
(1990,p."1990"),
(1991,p."1991"),
(1992,p."1992"),
(1993,p."1993"),
(1994,p."1994"),
(1995,p."1995"),
(1996,p."1996"),
(1997,p."1997"),
(1998,p."1998"),
(1999,p."1999"),
(2000,p."2000"),
(2001,p."2001"),
(2002,p."2002"),
(2003,p."2003"),
(2004,p."2004"),
(2005,p."2005"),
(2006,p."2006"),
(2007,p."2007"),
(2008,p."2008"),
(2009,p."2009"),
(2010,p."2010"),
(2011,p."2011"),
(2012,p."2012"),
(2013,p."2013"),
(2014,p."2014"),
(2015,p."2015"),
(2016,p."2016"),
(2017,p."2017"),
(2018,p."2018"),
(2019,p."2019"),
(2020,p."2020"),
(2021,p."2021"),
(2022,p."2022"),
(2023,p."2023"),
(2024,p."2024"),
(2025,p."2025")
  
) AS yv (year, value);

);


/*First time I created unpivot_pib table I forgot including "Indicator Name", so I deleted it and created the table 
again with the update*/
DROP TABLE unpivot_pib;