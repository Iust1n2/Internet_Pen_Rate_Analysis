#  First ML Project

This project consists in an application of one of the basic models of Machine Learning **(Polynomial Regression)** and Time-Series Analysis **(ARIMA)** in a real life problem. Choosing the Internet Penetration Rate as the main feature of the analysis and by looking at its major influencing factors, GDP and Urbanization Rate we can get a sense of how will the technological advancement look like in the following years. 

## Intuition

### Step 1: Settling on an underlying problem :thinking:

-> The different factors that impacted the unequal development/advancement of technology by looking at the Global Internet Penetration Rate and other relevant socio-economic coefficients.


### Step 2: Work environment :computer:
  - Excel for the display of various data from multiple sources
  - Jupyter Notebook for data preprocessing and visualization, implementing the ML algorithms
  - R for evaluating model performance
  - Libraries used: Pandas, Numpy, Matplotlib, Sklearn, Statsmodels


### Step 3: Gathering and preprocessing the data :bar_chart:

  The datasets for every coefficient were gathered from data.worldbank.org. The next step was to merge all three datasets into a single one. Initially, it included almost 300 observations for every country on the globe, but to be more efficient I narrowed it down to only 11 countries from all continents and rearranged it into a panel dataset. From there I chose Romania to be the target country. 

-> All datasets were gathered from https://data.worldbank.org

1. Internet Penetration Rate: https://data.worldbank.org/indicator/IT.NET.USER.ZS
2. GDP Growth Dataset: https://data.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG
3. GDP Dataset: https://data.worldbank.org/indicator/NY.GDP.MKTP.CD
4. Urbanization Rate Dataset: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS


### Step 4: Implementing the ML Models :chart_with_upwards_trend:

- **ARIMA**: predict the Internet Penetration Rate and the GDP and Urbanization Rate features individually
    1. Determining the parameters (p,d,q) of the ARIMA Model
    2. For the q parameter (number of moving-average terms) we plot the Autocorrelation and Partial Autocorrelation
    3. For the p parameter (number of autoregressive terms) we plot the 1st Order and 2nd Order Differencing
    4. For the d parameter (number of nonseasonal differencing) we perform the Augmented Dickey-Fuller test for stationarity
    5. We build the ARIMA Model with an order of (p,d,q) that we determined by looking at the plots

- **Polynomial Regression**: predict the Internet Penetration Rate % based on the GDP and Urbanization Rate features
    1. Create the standard model with y as the independent variable (Int Pen Rate) and X as the dependent variables (GDP per capita, GDP Growth % and Urbanization Rate %)
    2. Fitting the Polynomial Regression to our model and visualizing part
    3. Prediction of the Internet Penetration Rate based on the first model that had only GDP per capita and Urbanization Rate as features
    4. First model evaluation
    5. Prediction of the Internet Penetration Rate based on the second model that had all features
    6. Second model evaluation
 
:exclamation: In the **Polynomial Regression** implementation, for academic purposes in both the first and the second model I used the ARIMA predictions for years 2022-2024 when creating the Test sets and in the model evaluation for the actual values of the Internet Penetration Rate.


### Step 5: Conclusion :white_check_mark:

  During the Polynomial Regression implementation, while testing various features combinations I came across the most accurate model when looking at the predictions of the regression and the predictions of the ARIMA Model, which is the model containing the GDP per capita and Urbanization Rate % as exogenous variables. 
  
  Also, in Jupyter Notebook, the model evaluation showed quite good results when looking at the R-squared score: for the 2019-2021 range in which I used the actual values for the train set and the random values for the test set, the R-score was 0.8186 and for the 2022-2024 range in which I used the ARIMA predictions for both the train and test set, the R-score was  0.9626.



