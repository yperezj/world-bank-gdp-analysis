# Economic Indicators Analysis

## Nominal GDP (Current US$)

### Project Overview

This project explores World Bank data on nominal GDP measured in current US$ using SQL and Excel. The analysis focuses on data coverage and the evolution of Spain's GDP through annual growth rates and compound annual growth rates (CAGR), including cumulative, fixed 10-year and rolling 10-year approaches.

The project is designed as an exploratory economic data analysis rather than an assessment of economic welfare or development. 

### Objectives

- Assess World Bank data continuity and historical depth by country/region, providing a data coverage assessment.
  
- Examine the evolution of nominal GDP in Spain.
  
- Calculate cumulative CAGR, fixed 10-year CAGR and rolling 10-year CAGR, allowing comparison of the different CAGR approaches.

### Dataset & Source

The dataset used in this project comes from the World Bank's World Development Indicators (WDI), using the indicator **GDP (current US$)** (indicator code: 'NY.GDP.MKTP.CD'). It contains annual observations covering the period from 1960 to 2025 and includes data for countries, economies and regional aggregates.

**Source:** World Bank, World Development Indicators (WDI)

**Indicator:** GDP (current US$)

**Indicator code:** `NY.GDP.MKTP.CD` 

**Dataset period:** 1960-2025

**License:** CC BY 4.0

[World Bank - GDP (current US$)](https://data.worldbank.org/indicator/NY.GDP.MKTP.CD)

### Methodology

The analysis was conducted using SQL for data extraction, transformation and calculation of the defined metrics, and Excel for data summarization and visualization. 

#### Data Coverage   

Data coverage was assessed using two complementary indicators:

- **Continuity:** the percentage of annual observations available between the first available observation and 2025.
- **Historical depth:** the number of years covered from the first available observation until 2025.

These metrics are considered separately because a longer historical series does not necessarily indicate better continuity, and comparing series length alone could disadvantage countries with shorter histories.

![Data Coverage Analysis](images/02_data_coverage.png) 

#### Analysis 

##### Spain GDP Evolution 

![Spain GDP Evolution: GDP growth and cumulative CAGR](images/03_spain_gdp.png)

##### Decade CAGR Analysis

![Spain decade CAGR: fixed and rolling ten-year windows](images/04_spain_10y_cagr.png)

### Limitations

- Nominal GDP measured in current US$ is not a direct measure of economic welfare, living standards or development
  
- Changes in nominal GDP expressed in US$ can reflect changes in domestic output, prices and exchange rates.

- The analysis focuses on Spain as a case study and does not attempt to provide a comprehensive cross-country economic comparison.

- Data availability and historical depth vary across countries and regional aggregates, which should be considered when interpreting the results, as they may affect the reliability and comparability of the analysis.

### Structure

```
World Bank Economic Indicators Analysis 
├── Excel
│    └──── 01_gdp_analysis.xlsx
├── SQL  
│    ├──── 01_schema.sql
│    ├──── 02_data_transformation.sql
│    ├──── 03_data_loading.sql
│    ├──── 04_data_coverage.sql
│    ├──── 05_gdp_growth.sql
│    ├──── 06_cumulative_cagr.sql
│    ├──── 07_fixed_10-year-cagr.sql
│    ├──── 08_rolling_10_year_cagr.sql
│    └──── 09_spain_queries.sql
├── Images
│    ├──── 01_cover.png
│    ├──── 02_data_coverage.png
│    ├──── 03_spain_gdp.png
│    └──── 04_spain_10y_cagr.png
└── README.md

``` 




