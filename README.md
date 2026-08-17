# Economic Indicators Analysis

## Nominal GDP (Current US$)

### Project Overview

This project explores World Bank data on nominal GDP measured in current US$ using SQL and Excel. The analysis focuses on data quality and the evolution of Spain's GDP through annual growth rates and compound annual growth rates (CAGR) using cumulative, fixed-period and rolling-period approaches. 

The project is designed as an exploratory economic data analysis rather than an assessment of economic welfare or development. 

### Objectives

- Assess World Bank data continuity and historical depth, developing a data quality indicator by country/region.
  
- Examine the evolution of nominal GDP in Spain.
  
- Calculate cumulative CAGR, fixed-period decade CAGR and rolling-period decade CAGR, allowing comparison of the different CAGR approaches.

### Dataset & Source

The dataset used in this project comes from the World Bank's World Development Indicators (WDI), using the indicator **GDP (current US$)** (indicator code: 'NY.GDP.MKTP.CD'). It covers annual observations from 1960 to 2025 and includes data for countries, economies and regional aggregates.

**Source:** World Bank, World Development Indicators (WDI)
**Indicator:** GDP (current US$)
**Indicator code:** `NY.GDP.MKTP.CD` 
**Period:** 1960-2025
**License:** CC BY 4.0

[World Bank - GDP (current US$)]https://data.worldbank.org/indicator/NY.GDP.MKTP.CD

### Methodology

The analysis was conducted using SQL for data extraction, transformation and calculation of previously defined metrics, and Excel for data summarization and visualization. 

#### Data Quality   

Data quality was assessed using two complementary indicators:

- **Continuity:** the percentage of annual observations available between the first available observation and 2025.
- **Historical depth:** the number of years covered from the first available observation until 2025.

These metrics are considered separately because a longer historical series does not necessarily indicate better continuity, and comparing series length alone could disadvantage countries with shorter histories.

![Data Quality Analysis](<img width="1189" height="350" alt="data_quality" src="https://github.com/user-attachments/assets/f3c3ddac-b574-4720-b636-7317097d042d" />)

#### Analysis 

##### Spain GDP Evolution 

![Spain GDP Evolution: GDP growth and cummulative CAGR evolution](<img width="1154" height="410" alt="spain_gdp" src="https://github.com/user-attachments/assets/1ff3b093-02d7-4af3-8b4d-b5855bb4f6fd" />)

##### Decade CAGR Analysis

![Spain decade Compound Annual Growth Rate (CAGR): fixed and rolling ten-year windows](<img width="1284" height="407" alt="spain_10y_cagr" src="https://github.com/user-attachments/assets/91a8c22d-cb47-492d-a93a-565cd640c55d" />)

### Limitations

- Nominal GDP measured in current US$ is not a direct measure of economic welfare, living standards or development
  
- Changes in nominal GDP expressed in US$ can reflect changes in domestic output, prices and exchange rates.

- The analysis focuses on Spain as a case study and does not attempt to provide a comprehensive cross-country economic comparison.

- Data availability and historical depth vary across countries and regional aggregates, which should be considered when interpreting the data quality results. 



