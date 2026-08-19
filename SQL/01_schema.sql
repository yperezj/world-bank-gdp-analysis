CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	iso_code CHAR(3) UNIQUE NOT NULL,
	continent VARCHAR(30) 

);


CREATE TABLE indicators(
id SERIAL PRIMARY KEY,
indicator VARCHAR(100) NOT NULL,
code VARCHAR(100) UNIQUE NOT NULL

);


CREATE TABLE observations(

country_id INT NOT NULL , 
indicator_id INT NOT NULL, 
year INT NOT NULL,
value NUMERIC(20,3),

UNIQUE (country_id,indicator_id,year),

FOREIGN KEY(country_id)
REFERENCES countries(id),

FOREIGN KEY (indicator_id)
REFERENCES indicators(id)

);


/*Helper query: the query returns a serie of strings that we will use in our staging table. 
 STRING_AGG concatenates ' " ', consecutive numbers from the first recorded year to the 
 last one, '  " ' , and the word 'NUMERIC'. Then we will paste the result within the 
 SELECT of our final table. This way we avoid writing manually every "year column". */
 

SELECT STRING_AGG(' "' || generate_series || '" NUMERIC', E',\n')

FROM GENERATE_SERIES(1960, 2025);


/*Staging table matching the original World Bank dataset structure. It is used to import the raw 
CSV before transforming the data into the normalized schema above.*/


CREATE TABLE pib (
"Country Name" TEXT,
"Country Code" CHAR(3),
"Indicator Name" TEXT,
"Indicator Code" TEXT,
 "1960" NUMERIC, 
 "1961" NUMERIC, 
 "1962" NUMERIC, 
 "1963" NUMERIC, 
 "1964" NUMERIC, 
 "1965" NUMERIC, 
 "1966" NUMERIC, 
 "1967" NUMERIC, 
 "1968" NUMERIC, 
 "1969" NUMERIC, 
 "1970" NUMERIC, 
 "1971" NUMERIC, 
 "1972" NUMERIC, 
 "1973" NUMERIC, 
 "1974" NUMERIC, 
 "1975" NUMERIC, 
 "1976" NUMERIC, 
 "1977" NUMERIC, 
 "1978" NUMERIC, 
 "1979" NUMERIC, 
 "1980" NUMERIC, 
 "1981" NUMERIC, 
 "1982" NUMERIC, 
 "1983" NUMERIC, 
 "1984" NUMERIC, 
 "1985" NUMERIC, 
 "1986" NUMERIC, 
 "1987" NUMERIC, 
 "1988" NUMERIC, 
 "1989" NUMERIC, 
 "1990" NUMERIC, 
 "1991" NUMERIC, 
 "1992" NUMERIC, 
 "1993" NUMERIC, 
 "1994" NUMERIC, 
 "1995" NUMERIC, 
 "1996" NUMERIC, 
 "1997" NUMERIC, 
 "1998" NUMERIC, 
 "1999" NUMERIC, 
 "2000" NUMERIC, 
 "2001" NUMERIC, 
 "2002" NUMERIC, 
 "2003" NUMERIC, 
 "2004" NUMERIC, 
 "2005" NUMERIC, 
 "2006" NUMERIC, 
 "2007" NUMERIC, 
 "2008" NUMERIC, 
 "2009" NUMERIC, 
 "2010" NUMERIC, 
 "2011" NUMERIC, 
 "2012" NUMERIC, 
 "2013" NUMERIC, 
 "2014" NUMERIC, 
 "2015" NUMERIC, 
 "2016" NUMERIC, 
 "2017" NUMERIC, 
 "2018" NUMERIC, 
 "2019" NUMERIC, 
 "2020" NUMERIC, 
 "2021" NUMERIC, 
 "2022" NUMERIC, 
 "2023" NUMERIC, 
 "2024" NUMERIC, 
 "2025" NUMERIC

);

/*Two regional aggregates (AFE and AFW) had missing "Country Name" in the imported
dataset. After verifying that only these two records were affected, they will be
corrected manually*/

UPDATE pib
SET "Country Name"='África oriental y meridional'
WHERE "Country Code"='AFE';

UPDATE pib
SET "Country Name"='África occidental y central'
WHERE "Country Code"='AFW';
