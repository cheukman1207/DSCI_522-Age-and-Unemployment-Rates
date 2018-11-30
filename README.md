
# Age and Unemployment Rates

Contributors: 

CHIU, CHEUK MAN (github.com ID: [cheukman1207](https://github.com/cheukman1207) )

BOYCE, HAYLEY (github.com ID: [hfboyce](https://github.com/hfboyce) )

## Overview:

To conduct our analysis, we want to know if an individual's age has a significant effect on getting employed. In order to expand on that question, in this project, for a set of developed countries, we will be determining if the mean unemployment rate changes based on age group. The exploratory question that we will attempt to answer in this analysis is  

*" For developed countries in the past 5 years, is there a difference in the mean unemployment rates in different age groups?"*. 

The different age groups we will be comparing are 15-24, 25-54, 55-64. A large assumption we are making is that both observations of males and female are equally important. To help visualize our data, we created a violin plot with overlaying jitter in the hopes of giving a better idea on the distributions of data for each age group. To explore more closely, the 95% confidence intervals of the average unemployment rates for each age group give a better understanding of the differentiation of the means unemployment rates. 
To answer this question we will use ANOVA to see if the selected age groups differ. Depending on the results of the ANOVA, further analysis using pairwise t-tests will be conducted to explore exactly which age groups differ from one another.

## Data:

Dataset: [Employment: Unemployment rate by sex and age group](https://stats.oecd.org/index.aspx?queryid=54743) by OECD.org.   
Also can be found in the [data](https://github.com/UBC-MDS/DSCI_522-Age-and-Unemployment-Rates/tree/master/data) directory of this repository. 

## Usage:

1.    Please clone this repo, and locate yourself to the root of where this project is saved.
2.    Run the following commands:

```
Rscript src/01_clean-data.R data/unemployment-age-gender.csv data/unemployment-age-gender-countries-filtered-clean.csv 
Rscript src/02_visualize-data.R data/unemployment-age-gender-countries-filtered-clean.csv img/
Rscript src/03_anova.R  data/unemployment-age-gender-countries-filtered-clean.csv results/anova-table.csv  
Rscript src/04_pairwise-ttest.R  data/unemployment-age-gender-countries-filtered-clean.csv results/pairwise-test-table.csv  
Rscript -e "rmarkdown::render('doc/age-and-unemployment-rates-report.Rmd')"  

```
in addition you can use the [run_all.sh]() script or use the [Makefile](https://github.com/UBC-MDS/DSCI_522-Age-and-Unemployment-Rates/blob/master/Makefile)

## Procedure: 


![]("insert link here")




## Dependencies:

•    R & R libraries:  (version 3.5.1 )
o    [tidyverse](https://github.com/tidyverse)
o    [ggplot2] (https://github.com/tidyverse/ggplot2)